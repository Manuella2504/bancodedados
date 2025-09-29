# 📊 Meu Primeiro Banco de Dados

## 📋 Descrição do Projeto

Este é o meu primeiro projeto de banco de dados relacional, desenvolvido como parte do meu aprendizado em modelagem de dados e SQL. O sistema foi projetado para gerenciar informações de uma **biblioteca escolar**, incluindo livros, autores, usuários e empréstimos.

## 🎯 Objetivos

- Aplicar conceitos de modelagem de banco de dados
- Implementar relacionamentos entre entidades
- Praticar comandos SQL (DDL, DML, DQL)
- Compreender normalização de dados
- Criar consultas complexas com JOINs

### Relacionamentos:

- **USUARIO** ←→ **EMPRESTIMO** (1:N) - Um usuário pode ter vários empréstimos
- **LIVRO** ←→ **EMPRESTIMO** (1:N) - Um livro pode ser emprestado várias vezes
- **LIVRO** ←→ **AUTOR** (N:N) - Um livro pode ter vários autores e um autor pode escrever vários livros

## 🗄️ Estrutura do Banco

### Tecnologias Utilizadas:
- **SGBD:** MySQL 8.0
- **Linguagem:** SQL
- **Ferramenta de Modelagem:** MySQL Workbench

### Scripts Principais:

```
📁 database/
├── 📄 01_create_database.sql    # Criação do banco e tabelas
├── 📄 02_insert_data.sql        # Inserção de dados de exemplo
├── 📄 03_queries.sql            # Consultas de exemplo
└── 📄 04_procedures.sql         # Stored procedures (opcional)
```

## 🚀 Como Executar

### Pré-requisitos:
- MySQL Server instalado
- Cliente MySQL (MySQL Workbench, phpMyAdmin, ou terminal)


*Primeiro projeto de banco de dados - [Data de criação]*
