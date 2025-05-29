
-- ########################################################
-- Arquivo: criar_db.sql
-- Criado por: Danieli Queiroz
-- Objetivo: Criar o banco de dados fictício e suas tabelas 
-- ########################################################

-- ============================================
-- 1. COMANDO PARA A CRIAÇÃO DO BANCO DE DADOS 
-- ============================================

CREATE DATABASE IF NOT EXISTS banco_financeiro;
USE banco_financeiro;

-- =======================================
-- 2. COMANDOS PARA A CRIAÇÃO DAS TABELAS 
-- =======================================

CREATE TABLE `clientes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) DEFAULT NULL,
  `cpf` VARCHAR(14) DEFAULT NULL,
  `data_nascimento` DATE DEFAULT NULL,
  `sexo` ENUM('M','F') DEFAULT NULL,
  `renda_mensal` DECIMAL(10,2) DEFAULT NULL,
  `profissao` VARCHAR(100) DEFAULT NULL,
  `cidade` VARCHAR(100) DEFAULT NULL,
  `estado` VARCHAR(2) DEFAULT NULL,
  `criado_em` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `contas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` INT(11) NOT NULL,
  `tipo` ENUM('Corrente','Poupança','Salário') DEFAULT NULL,
  `saldo` DECIMAL(12,2) DEFAULT NULL,
  `data_abertura` DATE DEFAULT NULL,
  `ativo` TINYINT(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `transacoes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `conta_id` INT(11) NOT NULL,
  `tipo` ENUM('Crédito','Débito') DEFAULT NULL,
  `valor` DECIMAL(10,2) DEFAULT NULL,
  `descricao` VARCHAR(255) DEFAULT NULL,
  `data` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`conta_id`) REFERENCES `contas`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `emprestimos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` INT(11) NOT NULL,
  `valor_emprestimo` DECIMAL(12,2) DEFAULT NULL,
  `parcelas` INT(11) DEFAULT NULL,
  `taxa_juros` DECIMAL(5,2) DEFAULT NULL,
  `data_inicio` DATE DEFAULT NULL,
  `status` ENUM('Ativo','Quitado','Inadimplente') DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ########################################################
-- Fim dos comandos SQL
-- Este arquivo faz parte do meu portfólio de análise de dados.
-- GitHub: github.com/danieli-queiroz
-- ########################################################