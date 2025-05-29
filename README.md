# analise-pratica-com-sql
Análise de Dados Bancários Fictícios utilizando SQL.

# 💰 SQL Analytics: Insights Financeiros com MySQL no XAMPP

## 📁 Descrição do Projeto:

  Este projeto apresenta uma análise exploratória de dados bancários fictícios utilizando SQL puro no ambiente XAMPP com MySQL. O objetivo é extrair insights estratégicos sobre o perfil de clientes, inadimplência e comportamento financeiro, contribuindo para tomadas de decisão baseadas em dados.

## 🔍 Sobre os dados
  A base simula operações reais de um banco comercial tradicional, contendo informações de:

- Clientes
- Tipos de Contas
- Transações bancárias
- Empréstimos e seus pagamentos
- Localização dos clientes

## 🛠️ Ferramentas utilizadas

- 💻 XAMPP (Apache + MySQL)
- 🗃️ phpMyAdmin para criação do banco de dados e execução das queries
- 📸 Capturas de tela – Resultados visuais das consultas


## 📈 Principais análises realizadas
  As queries SQL foram desenvolvidas para responder perguntas estratégicas, como:

- Quais estados concentram mais clientes e quais têm maior número de inadimplentes?
- Quem são os clientes com maior score de risco (baseado em atraso no pagamento de empréstimos)?
- Qual a média de saldo bancário por tipo de conta?
- Qual a proporção de clientes ativos com empréstimos em aberto por filial?
- Quais clientes são mais valiosos para o banco e quais representam maior risco de crédito?

Foram utilizados recursos como:

- JOINs e subqueries
- CTEs (Common Table Expressions)
- GROUP BY e agregações
- Criação de indicadores e score de risco
- Análise de churn e inadimplência

## 🧠 Insight de negócio
  A partir das análises, foi possível:
- Identificar clientes com alto risco de inadimplência
- Mapear os estados com maior concentração de clientes estratégicos
- Estimar o churn com base em inatividade e saldos zerados
- Propor um score de risco customizado para apoiar a concessão de crédito
- Esses insights poderiam apoiar ações como campanhas de retenção, estratégias de crédito mais seguras e investimentos em filiais com maior potencial.

## 🧠 Conclusão : 

  A partir das análises, foi possível identificar clientes com risco elevado de inadimplência, estimar churn e mapear os estados com maior concentração de clientes valiosos, fornecendo subsídios para ações de retenção, crédito e marketing.
  Este projeto mostra que análises profundas podem ser realizadas com SQL puro, desde que bem estruturadas. Com ele, desenvolvi visão analítica, domínio de lógica SQL e foco em resolução de problemas reais do setor bancário.

## 📥 Como rodar localmente:

1) Instale o XAMPP e ative o módulo MySQL
2) Acesse o phpMyAdmin
3) Importe o banco de dados (arquivo banco_financeiro.sql incluído no repositório)
4) Execute os comandos do arquivo queries.sql
5) Visualize os resultados nas tabelas e prints disponíveis na pasta /imagens

# 📂 Organização do repositório:

📁 /imagens
   - Capturas de tela dos resultados das queries (formato PNG)

📄 arquivos.sql
   - criar_db.sql : Arquivo para a criação do banco de dados e suas tabelas.
   - insert.sql : Arquivo com os comandos para inserção dos dados fictícios no bando de dados.
   - queries.sql : Arquivo com todas as queries executadas.
   - banco_financeiro.sql : Arquivo para a importação do banco de dados utilizado nesta análise. 

📄 README.md
   - Este documento
   
🚀 Próximos passos
- Criar um dashboard interativo no Power BI
- Explorar modelagem preditiva simples com Python (ex: regressão para prever inadimplência)
- Aplicar as mesmas queries em outro SGBD (ex: PostgreSQL)

🙋‍♀️ Sobre mim
Sou a Danieli, estudante de Banco de Dados apaixonada por transformar dados em decisões. Este é um dos projetos para a construção do meu portfólio com foco em análise exploratória, raciocínio lógico e aplicação prática de SQL.

📬 Me acompanhe no LinkedIn para mais projetos como este no link abaixo:
  www.linkedin.com/in/danieli-queirozprofissional









