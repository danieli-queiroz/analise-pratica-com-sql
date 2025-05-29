-- ########################################################
-- Arquivo: queries.sql
-- Criado por: Danieli Queiroz
-- Objetivo: Consultas SQL para análise de dados bancários
-- Base de dados fictícia com tabelas: clientes, contas, transacoes, emprestimos
-- ########################################################


-- ===============================
-- 1. Total de clientes por estado
-- ===============================

-- Conta quantos clientes há em cada estado, ordenando pelo estado com mais clientes

SELECT estado, COUNT(*) AS total_clientes
FROM clientes
GROUP BY estado
ORDER BY total_clientes DESC;

-- ====================================================
-- 2. Média da renda mensal dos clientes por profissão
-- ====================================================

-- Mostra a renda média por profissão, ordenando da maior para a menor

SELECT profissao, AVG(renda_mensal) AS media_renda
FROM clientes
GROUP BY profissao
ORDER BY media_renda DESC;

-- =============================================================
-- 3. Saldo total por tipo de conta (considerando contas ativas)
-- ============================================================= 

SELECT tipo, SUM(saldo) AS saldo_total
FROM contas
WHERE ativo = TRUE
GROUP BY tipo;

-- =====================================================
-- 4. Clientes com maior saldo total em contas (top 10)
-- =====================================================

-- Soma saldo por cliente e retorna os 10 maiores

SELECT c.id, c.nome, SUM(co.saldo) AS saldo_total
FROM clientes c
JOIN contas co ON c.id = co.cliente_id
WHERE co.ativo = TRUE
GROUP BY c.id, c.nome
ORDER BY saldo_total DESC
LIMIT 10;

-- =======================================
-- 5. Número de transações por tipo e mês
-- =======================================

-- Conta quantas transações de cada tipo ocorreram por mês e ano

SELECT 
    tipo,
    YEAR(data) AS ano,
    MONTH(data) AS mes,
    COUNT(*) AS total_transacoes
FROM transacoes
GROUP BY tipo, ano, mes
ORDER BY ano, mes, tipo;

-- ===============================================
-- 6. Valor médio de transações por tipo de conta
-- ===============================================

SELECT 
  co.tipo,
  ROUND(AVG(t.valor), 2) AS media_transacao
FROM contas co
JOIN transacoes t ON co.id = t.conta_id
GROUP BY co.tipo;

-- ==============================================================================
-- 7. Total de valores movimentados (Crédito e Débito) por cliente no último mês 
-- ==============================================================================

SELECT c.id, c.nome,
       SUM(CASE WHEN t.tipo = 'Crédito' THEN t.valor ELSE 0 END) AS total_credito,
       SUM(CASE WHEN t.tipo = 'Débito' THEN t.valor ELSE 0 END) AS total_debito
FROM clientes c
JOIN contas co ON c.id = co.cliente_id
JOIN transacoes t ON co.id = t.conta_id
WHERE t.data >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY c.id, c.nome
ORDER BY c.nome;

-- ==========================================
-- 8. Clientes com empréstimos inadimplentes
-- ==========================================

SELECT c.id, c.nome, c.cidade, c.estado, e.valor_emprestimo, e.status
FROM clientes c
JOIN emprestimos e ON c.id = e.cliente_id
WHERE e.status = 'Inadimplente';

-- =============================================
-- 9. Taxa média de juros dos empréstimos ativos
-- =============================================

SELECT AVG(taxa_juros) AS taxa_juros_media_ativa
FROM emprestimos
WHERE status = 'Ativo';

-- ===================================================
-- 10. Empréstimos por status e quantidade de parcelas
-- ===================================================

SELECT status, parcelas, COUNT(*) AS total_emprestimos
FROM emprestimos
GROUP BY status, parcelas
ORDER BY status, parcelas;

-- ==================================================================
-- 11. Evolução do saldo total das contas ao longo do tempo (por mês)
-- ==================================================================

SELECT DATE_FORMAT(data_abertura, '%Y-%m') AS mes_ano,
       SUM(saldo) AS saldo_total
FROM contas
GROUP BY mes_ano
ORDER BY mes_ano;

-- ============================================================================
-- 12. Total movimentado por cliente (somando todos os valores das transações)
-- ============================================================================

SELECT 
  c.id AS cliente_id,
  c.nome,
  SUM(t.valor) AS total_movimentado
FROM clientes c
JOIN contas co ON c.id = co.cliente_id
JOIN transacoes t ON co.id = t.conta_id
GROUP BY c.id, c.nome
ORDER BY total_movimentado DESC;

-- =====================================================================
-- 13. Ranking e participação percentual de clientes por saldo (top 50)
-- =====================================================================

SELECT
  c.id,
  c.nome,
  SUM(co.saldo) AS saldo_total,
  RANK() OVER (ORDER BY SUM(co.saldo) DESC) AS rank_saldo,
  ROUND(SUM(co.saldo) * 100.0 / SUM(SUM(co.saldo)) OVER (), 2) AS pct_participacao_saldo
FROM clientes c
JOIN contas co ON c.id = co.cliente_id
GROUP BY c.id, c.nome
ORDER BY saldo_total DESC
LIMIT 50;

-- ======================================================================
-- 14. Churn: clientes que não movimentaram dinheiro nos últimos 3 meses
-- ======================================================================

WITH ultima_transacao AS (
  SELECT 
    co.cliente_id, 
    MAX(t.data) AS ultima_data_transacao
  FROM contas co
  JOIN transacoes t ON co.id = t.conta_id
  GROUP BY co.cliente_id
)
SELECT
  c.id, c.nome,
  ultima_data_transacao,
  CASE
    WHEN ultima_data_transacao < DATE_SUB(CURDATE(), INTERVAL 3 MONTH) THEN 'Churn'
    ELSE 'Ativo'
  END AS status_cliente
FROM clientes c
LEFT JOIN ultima_transacao ut ON c.id = ut.cliente_id
ORDER BY status_cliente, ultima_data_transacao DESC;

-- =============================================================================
-- 15. Segmentação dos clientes em High, Medium e Low value (valor movimentado)
-- =============================================================================

WITH movimentacoes AS (
  SELECT 
    c.id,
    c.nome,
    SUM(t.valor) AS total_movimentado
  FROM clientes c
  JOIN contas co ON c.id = co.cliente_id
  JOIN transacoes t ON co.id = t.conta_id
  GROUP BY c.id, c.nome
),
percentis AS (
  SELECT
    total_movimentado,
    NTILE(3) OVER (ORDER BY total_movimentado DESC) AS segmento
  FROM movimentacoes
)
SELECT
  m.id,
  m.nome,
  m.total_movimentado,
  CASE segmento
    WHEN 1 THEN 'High Value'
    WHEN 2 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS segmento_cliente
FROM movimentacoes m
JOIN percentis p ON m.total_movimentado = p.total_movimentado
ORDER BY total_movimentado DESC;

-- ===================================================
-- 16. Score de risco simples com múltiplos critérios
-- ===================================================

WITH transacoes_ultimos_6_meses AS (
  SELECT co.cliente_id, COUNT(*) AS transacoes_6m
  FROM contas co
  JOIN transacoes t ON co.id = t.conta_id
  WHERE t.data >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
  GROUP BY co.cliente_id
),
inadimplentes AS (
  SELECT cliente_id, COUNT(*) AS qtd_inadimplentes
  FROM emprestimos
  WHERE status = 'Inadimplente'
  GROUP BY cliente_id
),
saldos AS (
  SELECT cliente_id, SUM(saldo) AS saldo_total
  FROM contas
  GROUP BY cliente_id
)
SELECT
  c.id, c.nome,
  saldo_total,
  COALESCE(t.transacoes_6m, 0) AS transacoes_6m,
  COALESCE(i.qtd_inadimplentes, 0) AS qtd_inadimplentes,
  CASE 
    WHEN saldo_total < 0 AND COALESCE(i.qtd_inadimplentes, 0) > 0 AND COALESCE(t.transacoes_6m, 0) < 5 THEN 'Alto Risco'
    WHEN saldo_total < 0 OR COALESCE(i.qtd_inadimplentes, 0) > 0 THEN 'Médio Risco'
    ELSE 'Baixo Risco'
  END AS score_risco
FROM clientes c
LEFT JOIN saldos s ON c.id = s.cliente_id
LEFT JOIN transacoes_ultimos_6_meses t ON c.id = t.cliente_id
LEFT JOIN inadimplentes i ON c.id = i.cliente_id
ORDER BY score_risco DESC, saldo_total ASC;

-- =======================================
-- 17. Estimativa de Lifetime Value (LTV)
-- =======================================

-- Receita estimada do cliente = total movimentado - valor dos empréstimos

SELECT
  c.id, c.nome,
  SUM(t.valor) AS receita_movimentacao,
  COALESCE(SUM(e.valor_emprestimo), 0) AS valor_emprestimos,
  (SUM(t.valor) - COALESCE(SUM(e.valor_emprestimo), 0)) AS ltv_estimada
FROM clientes c
LEFT JOIN contas co ON c.id = co.cliente_id
LEFT JOIN transacoes t ON co.id = t.conta_id
LEFT JOIN emprestimos e ON c.id = e.cliente_id
GROUP BY c.id, c.nome
ORDER BY ltv_estimada DESC
LIMIT 50;

-- ===================================================================================
-- 18. Criar uma view para resumo de clientes (total contas, transações e empréstimos)
-- ===================================================================================

CREATE OR REPLACE VIEW vw_resumo_clientes AS
SELECT 
  c.id AS cliente_id,
  c.nome,
  COUNT(DISTINCT co.id) AS total_contas,
  COALESCE(SUM(t.valor), 0) AS total_transacionado,
  COALESCE(SUM(e.valor_emprestimo), 0) AS total_emprestimos
FROM clientes c
LEFT JOIN contas co ON co.cliente_id = c.id
LEFT JOIN transacoes t ON t.conta_id = co.id
LEFT JOIN emprestimos e ON e.cliente_id = c.id
GROUP BY c.id, c.nome;

-- ========================================================================
-- 19. Top 10 clientes que mais movimentaram dinheiro nos últimos 6 meses
-- ========================================================================

SELECT c.nome, SUM(t.valor) AS total
FROM clientes c
JOIN contas co ON co.cliente_id = c.id
JOIN transacoes t ON t.conta_id = co.id
WHERE t.data >= CURDATE() - INTERVAL 6 MONTH
GROUP BY c.nome
ORDER BY total DESC
LIMIT 10;

-- ########################################################
-- Fim das consultas SQL
-- Este arquivo faz parte do meu portfólio de análise de dados.
-- GitHub: github.com/danieli-queiroz
-- ########################################################
