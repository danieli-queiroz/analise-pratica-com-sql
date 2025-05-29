-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/05/2025 às 19:22
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_financeiro`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `renda_mensal` decimal(10,2) DEFAULT NULL,
  `profissao` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf`, `data_nascimento`, `sexo`, `renda_mensal`, `profissao`, `cidade`, `estado`, `criado_em`) VALUES
(1, 'Ana Sophia Araújo', '438.150.926', '1991-07-20', 'F', 1545.15, 'Ambulante', 'Espírito Santo', 'ES', '2025-05-22 15:14:10'),
(2, 'Maria Araújo', '836.194.205', '1996-11-23', 'F', 4579.51, 'Analista de Dados', 'Brasília', 'DF', '2025-05-22 15:14:10'),
(3, 'Bryan Nascimento', '158.420.376', '1975-02-23', 'M', 11363.30, 'Baixista', 'Brasília', 'DF', '2025-05-22 15:14:10'),
(4, 'Amanda Dias', '413.607.289', '1960-06-15', 'F', 9348.80, 'Vendedor(a)', 'Boa Vista', 'RR', '2025-05-22 15:14:10'),
(5, 'Melissa Cardoso Dias', '923.175.840', '1995-12-23', 'F', 1611.20, 'Gari', 'Palmas', 'TO', '2025-05-22 15:14:10'),
(6, 'Ian Nunes da Conceição de Ferreira', '413.952.867', '1976-04-23', 'M', 4410.72, 'Enfermeiro(a)', 'Salvador', 'BA', '2025-05-22 15:14:10'),
(7, 'Vinicius Teixeira Pereira', '468.215.307', '1986-11-06', 'M', 8945.18, 'Delegado(a)', 'Natal', 'RN', '2025-05-22 15:14:10'),
(8, 'João Pedro Nascimento da Cruz dos Dourados', '974.805.231', '1976-12-23', 'M', 4242.08, 'Analista de Sistemas', 'Rio Branco', 'AC', '2025-05-22 15:14:10'),
(9, 'Emanuella Santos Martins', '281.659.703', '2001-04-11', 'F', 12370.14, 'Médico(a)', 'João Pessoa', 'PB', '2025-05-22 15:14:10'),
(10, 'Carlos Eduardo Moreira', '430.197.526', '2004-12-01', 'M', 11671.54, 'Atuário(a)', 'Porto Velho', 'RO', '2025-05-22 15:14:10'),
(11, 'Maria Clara da Cunha', '486.197.253', '1979-03-15', 'F', 10834.32, 'Advogado(a)', 'Vitória', 'ES', '2025-05-22 15:14:10'),
(12, 'Joaquim Aragão Melo', '983.410.627', '1964-12-19', 'M', 5034.62, 'Biomédico(a)', 'Macapá', 'AP', '2025-05-22 15:14:10'),
(13, 'Eduarda Freitas Castro', '732.546.801', '2004-05-03', 'F', 14409.54, 'Cientista de Dados', 'Manaus', 'AM', '2025-05-22 15:14:10'),
(14, 'Larissa Moraes Farias', '697.850.431', '1998-12-10', 'F', 2610.50, 'Gestor(a) de qualidade', 'Brasília', 'DF', '2025-05-22 15:14:10'),
(15, 'Luiz Otávio Porto Carvalho', '269.731.045', '1972-10-30', 'M', 2534.69, 'Auxiliar de Escritório', 'São Paulo', 'SP', '2025-05-22 15:14:10'),
(16, 'Davi Luiz Oliveira ', '793.680.154', '1975-12-15', 'M', 9531.42, 'Engenheiro(a) de transportes', 'Boa Vista', 'RR', '2025-05-22 15:14:10'),
(17, 'Mirella Rodrigues Santos de Souza', '234.107.596', '1993-04-11', 'F', 11270.30, 'Artista', 'Fortaleza', 'CE', '2025-05-22 15:14:10'),
(18, 'Luiz Gustavo Cardoso', '218.573.094', '1988-10-13', 'M', 14629.00, 'Publicitário(a)', 'Belém', 'PA', '2025-05-22 15:14:10'),
(19, 'Maria Luiza Silveira', '543.962.178', '1988-04-17', 'F', 2287.44, 'Técnico(a) de Informática', 'São Paulo', 'SP', '2025-05-22 15:14:10'),
(20, 'André Ramos Gomes da Serra', '918.476.205', '1984-01-25', 'M', 12645.78, 'Engenheiro(a) civil', 'João Pessoa', 'PB', '2025-05-22 15:14:10'),
(21, 'Rafaela Jesus Fogaça', '980.542.731', '1997-03-29', 'F', 9167.46, 'Cambista', 'São Luís', 'MA', '2025-05-22 15:14:10'),
(22, 'Cecília Mendes Ferreira', '347.205.918', '1989-08-18', 'F', 1832.38, 'Gerente de banco', 'Fortaleza', 'CE', '2025-05-22 15:14:10'),
(23, 'Maria Clara Pereira Lima', '801.957.643', '1978-08-20', 'F', 11868.34, 'Agricultor(a)', 'Campo Grande', 'MS', '2025-05-22 15:14:10'),
(24, 'João Gabriel da Rocha', '315.649.802', '2003-10-27', 'M', 13003.38, 'Gerente de T.i', 'Florianópolis', 'SC', '2025-05-22 15:14:10'),
(25, 'Raul Farias das Neves', '421.306.759', '1973-03-07', 'M', 6445.74, 'Filósofo(a)', 'Rio Branco', 'AC', '2025-05-22 15:14:10'),
(26, 'Caroline Nunes da Luz Verde', '541.629.387', '1991-04-08', 'F', 9972.45, 'Dentista', 'Goiânia', 'GO', '2025-05-22 15:14:10'),
(27, 'Calebe Pinto Almeida do Galho', '596.470.328', '1976-09-21', 'M', 3444.63, 'Arquivista', 'Aracaju', 'SE', '2025-05-22 15:14:10'),
(28, 'Nina da Paz Oliveira Alegre', '561.924.830', '1998-05-14', 'F', 4091.20, 'Enfermeiro(a)', 'Belo Horizonte', 'MG', '2025-05-22 15:14:10'),
(29, 'Maria Clara Costela', '368.571.240', '1970-01-24', 'F', 10885.12, 'Chef de cozinha', 'Aracaju', 'SE', '2025-05-22 15:14:10'),
(30, 'Maria Martins Silva', '798.514.320', '1994-03-22', 'F', 9606.01, 'Pedagogo(a)', 'Macapá', 'AP', '2025-05-22 15:14:10'),
(31, 'Renan Lima Nogueira', '392.061.875', '1980-05-18', 'M', 8571.13, 'Vendedor(a)', 'Curitiba', 'PR', '2025-05-22 15:14:10'),
(32, 'Elisa da Conceição Cunha', '016.874.392', '2007-02-12', 'F', 3454.95, 'Cartógrafo(a)', 'Porto Velho', 'RO', '2025-05-22 15:14:10'),
(33, 'Maria Eduarda Lopes', '786.943.125', '1980-01-06', 'F', 4925.28, 'Engenheiro(a) de produção', 'São Paulo', 'SP', '2025-05-22 15:14:10'),
(34, 'Luiza Duarte da Costa', '471.528.693', '1986-02-22', 'F', 10647.68, 'Bancário(a)', 'Vitória', 'ES', '2025-05-22 15:14:10'),
(35, 'Olivia da Costa Aragão Verde', '316.924.780', '1963-06-18', 'F', 4360.86, 'Lutador(a) de luta livre', 'Belo Horizonte', 'MG', '2025-05-22 15:14:10'),
(36, 'Agatha Moraes Araújo de Nogueira', '468.957.130', '1967-12-17', 'F', 12309.63, 'Marketeiro(a)', 'Cuiabá', 'MT', '2025-05-22 15:14:10'),
(37, 'Nicole Nunes Cunha dos Dourados', '279.460.385', '1985-02-06', 'F', 4894.82, 'Sonoplasta', 'Fortaleza', 'CE', '2025-05-22 15:14:10'),
(38, 'Francisco Nascimento Aragão', '537.268.914', '2006-03-15', 'M', 13801.28, 'Advogado(a)', 'Maceió', 'AL', '2025-05-22 15:14:10'),
(39, 'Pietro Campos da Rosa', '093.184.652', '1981-08-12', 'M', 4134.25, 'Técnico(a) em tratamento de água', 'João Pessoa', 'PB', '2025-05-22 15:14:10'),
(40, 'Stella Moura Cardoso', '219.704.586', '1976-05-18', 'F', 6659.72, 'Urologista', 'Rio de Janeiro', 'RJ', '2025-05-22 15:14:10'),
(41, 'Elisa Cavalcanti Souza', '410.293.678', '1990-04-01', 'F', 3171.63, 'Médico(a)', 'Campo Grande', 'MS', '2025-05-22 15:14:10'),
(42, 'Laís da Costa Freitas', '624.793.518', '1971-04-27', 'F', 4603.46, 'Engenheiro(a) de alimentos', 'João Pessoa', 'PB', '2025-05-22 15:14:10'),
(43, 'Vitor Gabriel Rezende', '965.032.178', '1973-07-14', 'M', 11508.79, 'Engenheiro(a) de produção agroindustrial', 'Teresina', 'PI', '2025-05-22 15:14:10'),
(44, 'Luiz Henrique da Mota', '136.849.725', '1979-11-20', 'M', 13589.96, 'Agente de viagens', 'Vitória', 'ES', '2025-05-22 15:14:10'),
(45, 'Olivia Farias Fogaça de Lima', '457.962.381', '1973-04-30', 'F', 6195.55, 'Tosador(a)', 'Goiânia', 'GO', '2025-05-22 15:14:10'),
(46, 'Cauã da Mota Dias', '512.863.749', '1986-03-24', 'M', 8231.46, 'Degustador(a)', 'Fortaleza', 'CE', '2025-05-22 15:14:10'),
(47, 'André Teixeira Ribeiro do Amparo', '240.789.153', '1986-05-14', 'M', 11629.79, 'Programador(a)', 'João Pessoa', 'PB', '2025-05-22 15:14:10'),
(48, 'Benjamin Fernandes Cardoso', '718.360.452', '2004-08-02', 'M', 3309.21, 'Produtor(a) fonográfico', 'Manaus', 'AM', '2025-05-22 15:14:10'),
(49, 'Sophie Peixoto da Rosa', '936.872.510', '1990-11-15', 'F', 12130.70, 'Corretor(a) de Imóveis', 'Goiânia', 'GO', '2025-05-22 15:14:10'),
(50, 'Ana Júlia da Cruz Gomes', '321.709.486', '1989-03-17', 'F', 9430.44, 'Anestesiologista', 'Boa Vista', 'RR', '2025-05-22 15:14:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contas`
--

CREATE TABLE `contas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `tipo` enum('Corrente','Poupança','Salário') DEFAULT NULL,
  `saldo` decimal(12,2) DEFAULT NULL,
  `data_abertura` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contas`
--

INSERT INTO `contas` (`id`, `cliente_id`, `tipo`, `saldo`, `data_abertura`, `ativo`) VALUES
(1, 1, 'Corrente', 1580.45, '2023-04-15', 1),
(2, 2, 'Poupança', 23500.00, '2022-06-22', 1),
(3, 3, 'Salário', 3500.75, '2023-02-28', 1),
(4, 4, 'Corrente', 480.00, '2021-10-10', 0),
(5, 5, 'Poupança', 10200.00, '2022-11-01', 1),
(6, 6, 'Corrente', 720.30, '2023-01-25', 1),
(7, 7, 'Poupança', 18000.00, '2022-09-15', 1),
(8, 8, 'Salário', 4200.00, '2023-03-12', 1),
(9, 9, 'Corrente', 950.50, '2023-04-05', 1),
(10, 10, 'Poupança', 15000.00, '2022-12-10', 1),
(11, 11, 'Corrente', 1340.00, '2023-01-18', 1),
(12, 12, 'Salário', 3000.00, '2023-02-20', 1),
(13, 13, 'Poupança', 21000.00, '2022-07-07', 1),
(14, 14, 'Corrente', 400.00, '2021-12-01', 0),
(15, 15, 'Salário', 3750.00, '2023-04-01', 1),
(16, 16, 'Poupança', 12000.00, '2022-08-12', 1),
(17, 17, 'Corrente', 800.00, '2023-01-10', 1),
(18, 18, 'Salário', 4600.00, '2023-03-23', 1),
(19, 19, 'Poupança', 17000.00, '2022-05-20', 1),
(20, 20, 'Corrente', 560.00, '2021-11-30', 1),
(21, 21, 'Salário', 3800.00, '2023-02-05', 1),
(22, 22, 'Poupança', 19500.00, '2022-10-15', 1),
(23, 23, 'Corrente', 720.00, '2023-03-18', 1),
(24, 24, 'Salário', 4100.00, '2023-01-27', 1),
(25, 25, 'Poupança', 14000.00, '2022-09-28', 1),
(26, 26, 'Corrente', 1000.00, '2023-02-14', 1),
(27, 27, 'Salário', 3900.00, '2023-04-10', 1),
(28, 28, 'Poupança', 16000.00, '2022-07-30', 1),
(29, 29, 'Corrente', 850.00, '2023-01-19', 1),
(30, 30, 'Salário', 4300.00, '2023-03-08', 1),
(31, 31, 'Poupança', 12500.00, '2022-06-05', 1),
(32, 32, 'Corrente', 610.00, '2023-02-25', 1),
(33, 33, 'Salário', 3700.00, '2023-04-03', 1),
(34, 34, 'Poupança', 15500.00, '2022-10-10', 1),
(35, 35, 'Corrente', 930.00, '2023-01-05', 1),
(36, 36, 'Salário', 4000.00, '2023-03-22', 1),
(37, 37, 'Poupança', 18500.00, '2022-08-01', 1),
(38, 38, 'Corrente', 720.00, '2023-02-10', 1),
(39, 39, 'Salário', 4200.00, '2023-04-15', 1),
(40, 40, 'Poupança', 15000.00, '2022-05-18', 1),
(41, 41, 'Corrente', 550.00, '2023-01-29', 1),
(42, 42, 'Salário', 3600.00, '2023-03-17', 1),
(43, 43, 'Poupança', 17000.00, '2022-09-21', 1),
(44, 44, 'Corrente', 880.00, '2023-02-06', 1),
(45, 45, 'Salário', 3900.00, '2023-04-12', 1),
(46, 46, 'Poupança', 13500.00, '2022-07-19', 1),
(47, 47, 'Corrente', 600.00, '2023-01-15', 1),
(48, 48, 'Salário', 4100.00, '2023-03-11', 1),
(49, 49, 'Poupança', 15500.00, '2022-10-25', 1),
(50, 50, 'Corrente', 780.00, '2023-02-28', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `valor_emprestimo` decimal(12,2) DEFAULT NULL,
  `parcelas` int(11) DEFAULT NULL,
  `taxa_juros` decimal(5,2) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `status` enum('Ativo','Quitado','Inadimplente') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimos`
--

INSERT INTO `emprestimos` (`id`, `cliente_id`, `valor_emprestimo`, `parcelas`, `taxa_juros`, `data_inicio`, `status`) VALUES
(1, 1, 10000.00, 12, 2.50, '2023-01-10', 'Ativo'),
(2, 2, 7500.00, 24, 3.20, '2022-05-15', 'Quitado'),
(3, 3, 15000.00, 36, 4.00, '2023-03-20', 'Ativo'),
(4, 4, 5000.00, 6, 2.00, '2024-01-05', 'Quitado'),
(5, 5, 12000.00, 18, 3.50, '2023-11-10', 'Inadimplente'),
(6, 6, 8000.00, 12, 1.80, '2022-12-01', 'Ativo'),
(7, 7, 14000.00, 24, 4.20, '2023-06-17', 'Ativo'),
(8, 8, 2000.00, 6, 1.50, '2024-02-22', 'Quitado'),
(9, 9, 9000.00, 18, 3.00, '2023-07-09', 'Ativo'),
(10, 10, 11000.00, 30, 3.80, '2023-04-28', 'Inadimplente'),
(11, 11, 6000.00, 12, 2.20, '2022-08-15', 'Quitado'),
(12, 12, 13000.00, 24, 3.70, '2023-10-12', 'Ativo'),
(13, 13, 1000.00, 6, 1.90, '2024-03-03', 'Ativo'),
(14, 14, 18000.00, 36, 4.50, '2023-05-20', 'Inadimplente'),
(15, 15, 7000.00, 18, 2.80, '2023-09-11', 'Quitado'),
(16, 16, 9000.00, 12, 3.30, '2022-11-30', 'Ativo'),
(17, 17, 15000.00, 24, 4.10, '2023-07-25', 'Ativo'),
(18, 18, 4000.00, 6, 1.60, '2024-01-15', 'Quitado'),
(19, 19, 8000.00, 18, 3.40, '2023-08-29', 'Inadimplente'),
(20, 20, 12000.00, 30, 3.90, '2023-06-07', 'Ativo'),
(21, 21, 5000.00, 12, 2.10, '2022-10-21', 'Quitado'),
(22, 22, 10000.00, 24, 3.60, '2023-12-02', 'Ativo'),
(23, 23, 6000.00, 6, 1.70, '2024-02-10', 'Ativo'),
(24, 24, 14000.00, 36, 4.30, '2023-05-18', 'Inadimplente'),
(25, 25, 7000.00, 18, 2.90, '2023-09-27', 'Quitado'),
(26, 26, 8500.00, 12, 3.40, '2022-12-19', 'Ativo'),
(27, 27, 16000.00, 24, 4.00, '2023-08-15', 'Ativo'),
(28, 28, 3000.00, 6, 1.80, '2024-01-28', 'Quitado'),
(29, 29, 9500.00, 18, 3.10, '2023-07-04', 'Inadimplente'),
(30, 30, 13000.00, 30, 3.70, '2023-04-14', 'Ativo'),
(31, 31, 5500.00, 12, 2.40, '2022-09-10', 'Quitado'),
(32, 32, 12500.00, 24, 3.80, '2023-10-20', 'Ativo'),
(33, 33, 2000.00, 6, 1.60, '2024-03-08', 'Ativo'),
(34, 34, 17000.00, 36, 4.40, '2023-06-05', 'Inadimplente'),
(35, 35, 6500.00, 18, 2.70, '2023-08-01', 'Quitado'),
(36, 36, 8000.00, 12, 3.00, '2022-11-25', 'Ativo'),
(37, 37, 14000.00, 24, 4.20, '2023-07-30', 'Ativo'),
(38, 38, 4500.00, 6, 1.50, '2024-02-18', 'Quitado'),
(39, 39, 9000.00, 18, 3.30, '2023-08-22', 'Inadimplente'),
(40, 40, 11500.00, 30, 3.60, '2023-05-27', 'Ativo'),
(41, 41, 6000.00, 12, 2.00, '2022-10-05', 'Quitado'),
(42, 42, 11000.00, 24, 3.50, '2023-12-11', 'Ativo'),
(43, 43, 5000.00, 6, 1.70, '2024-01-22', 'Ativo'),
(44, 44, 15000.00, 36, 4.10, '2023-05-25', 'Inadimplente'),
(45, 45, 7000.00, 18, 2.90, '2023-09-05', 'Quitado'),
(46, 46, 9000.00, 12, 3.20, '2022-12-08', 'Ativo'),
(47, 47, 16000.00, 24, 4.00, '2023-08-20', 'Ativo'),
(48, 48, 2500.00, 6, 1.50, '2024-02-28', 'Quitado'),
(49, 49, 10000.00, 18, 3.10, '2023-07-12', 'Inadimplente'),
(50, 50, 13000.00, 30, 3.80, '2023-04-23', 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id` int(11) NOT NULL,
  `conta_id` int(11) DEFAULT NULL,
  `tipo` enum('Crédito','Débito') DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `transacoes`
--

INSERT INTO `transacoes` (`id`, `conta_id`, `tipo`, `valor`, `descricao`, `data`) VALUES
(51, 1, 'Crédito', 2500.00, 'Salário', '2025-05-01 09:00:00'),
(52, 2, 'Débito', 200.00, 'Supermercado', '2025-05-02 16:00:00'),
(53, 3, 'Crédito', 300.00, 'Transferência recebida', '2025-04-28 10:30:00'),
(54, 4, 'Débito', 150.00, 'Conta de Luz', '2025-05-03 18:20:00'),
(55, 5, 'Crédito', 1000.00, 'Depósito', '2025-04-20 12:15:00'),
(56, 6, 'Débito', 450.00, 'Compra eletrônicos', '2025-04-25 14:00:00'),
(57, 7, 'Crédito', 1800.00, 'Salário', '2025-05-01 08:45:00'),
(58, 8, 'Débito', 50.00, 'Café', '2025-05-02 09:15:00'),
(59, 9, 'Crédito', 600.00, 'Venda online', '2025-04-29 11:00:00'),
(60, 10, 'Débito', 120.00, 'Farmácia', '2025-05-03 15:30:00'),
(61, 11, 'Crédito', 750.00, 'Transferência', '2025-04-22 14:45:00'),
(62, 12, 'Débito', 300.00, 'Restaurante', '2025-04-26 20:10:00'),
(63, 13, 'Crédito', 2200.00, 'Salário', '2025-05-01 09:00:00'),
(64, 14, 'Débito', 100.00, 'Transporte', '2025-05-02 07:30:00'),
(65, 15, 'Crédito', 950.00, 'Bônus', '2025-04-27 13:00:00'),
(66, 16, 'Débito', 200.00, 'Supermercado', '2025-05-04 17:00:00'),
(67, 17, 'Crédito', 3000.00, 'Salário', '2025-05-01 08:30:00'),
(68, 18, 'Débito', 400.00, 'Compra roupas', '2025-05-03 19:00:00'),
(69, 19, 'Crédito', 600.00, 'Venda', '2025-04-29 12:00:00'),
(70, 20, 'Débito', 80.00, 'Cinema', '2025-05-02 21:00:00'),
(71, 21, 'Crédito', 1300.00, 'Transferência', '2025-04-25 10:00:00'),
(72, 22, 'Débito', 60.00, 'Café', '2025-05-01 08:00:00'),
(73, 23, 'Crédito', 4000.00, 'Salário', '2025-05-01 09:30:00'),
(74, 24, 'Débito', 150.00, 'Supermercado', '2025-05-02 16:30:00'),
(75, 25, 'Crédito', 850.00, 'Bônus', '2025-04-28 13:30:00'),
(76, 26, 'Débito', 300.00, 'Farmácia', '2025-05-03 14:15:00'),
(77, 27, 'Crédito', 1200.00, 'Venda', '2025-04-26 11:00:00'),
(78, 28, 'Débito', 400.00, 'Compra eletrônicos', '2025-05-04 18:00:00'),
(79, 29, 'Crédito', 2200.00, 'Salário', '2025-05-01 09:15:00'),
(80, 30, 'Débito', 100.00, 'Restaurante', '2025-05-02 20:00:00'),
(81, 31, 'Crédito', 700.00, 'Transferência', '2025-04-30 14:30:00'),
(82, 32, 'Débito', 250.00, 'Supermercado', '2025-05-03 15:45:00'),
(83, 33, 'Crédito', 1600.00, 'Salário', '2025-05-01 08:50:00'),
(84, 34, 'Débito', 70.00, 'Transporte', '2025-05-02 07:00:00'),
(85, 35, 'Crédito', 900.00, 'Venda', '2025-04-28 10:00:00'),
(86, 36, 'Débito', 150.00, 'Cinema', '2025-05-03 19:30:00'),
(87, 37, 'Crédito', 1800.00, 'Salário', '2025-05-01 09:05:00'),
(88, 38, 'Débito', 300.00, 'Compra roupas', '2025-05-02 20:15:00'),
(89, 39, 'Crédito', 1300.00, 'Bônus', '2025-04-29 12:30:00'),
(90, 40, 'Débito', 100.00, 'Farmácia', '2025-05-03 14:00:00'),
(91, 41, 'Crédito', 2100.00, 'Salário', '2025-05-01 09:10:00'),
(92, 42, 'Débito', 200.00, 'Supermercado', '2025-05-02 16:45:00'),
(93, 43, 'Crédito', 800.00, 'Transferência', '2025-04-27 13:45:00'),
(94, 44, 'Débito', 130.00, 'Restaurante', '2025-05-03 18:30:00'),
(95, 45, 'Crédito', 1500.00, 'Venda', '2025-04-30 10:15:00'),
(96, 46, 'Débito', 220.00, 'Compra eletrônicos', '2025-05-04 17:30:00'),
(97, 47, 'Crédito', 2400.00, 'Salário', '2025-05-01 08:40:00'),
(98, 48, 'Débito', 90.00, 'Café', '2025-05-02 09:30:00'),
(99, 49, 'Crédito', 1100.00, 'Bônus', '2025-04-28 11:30:00'),
(100, 50, 'Débito', 150.00, 'Supermercado', '2025-05-03 15:15:00');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_resumo_clientes`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_resumo_clientes` (
`cliente_id` int(11)
,`nome` varchar(100)
,`total_contas` bigint(21)
,`total_transacionado` decimal(32,2)
,`total_emprestimos` decimal(34,2)
);

-- --------------------------------------------------------

--
-- Estrutura para view `vw_resumo_clientes`
--
DROP TABLE IF EXISTS `vw_resumo_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_resumo_clientes`  AS SELECT `c`.`id` AS `cliente_id`, `c`.`nome` AS `nome`, count(distinct `co`.`id`) AS `total_contas`, coalesce(sum(`t`.`valor`),0) AS `total_transacionado`, coalesce(sum(`e`.`valor_emprestimo`),0) AS `total_emprestimos` FROM (((`clientes` `c` left join `contas` `co` on(`co`.`cliente_id` = `c`.`id`)) left join `transacoes` `t` on(`t`.`conta_id` = `co`.`id`)) left join `emprestimos` `e` on(`e`.`cliente_id` = `c`.`id`)) GROUP BY `c`.`id`, `c`.`nome` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `contas`
--
ALTER TABLE `contas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conta_id` (`conta_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `contas`
--
ALTER TABLE `contas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `contas`
--
ALTER TABLE `contas`
  ADD CONSTRAINT `contas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Restrições para tabelas `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Restrições para tabelas `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`conta_id`) REFERENCES `contas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
