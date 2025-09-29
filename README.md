# 📊 Meu Primeiro Banco de Dados

## 📋 Descrição do Projeto

Este é o meu primeiro projeto de banco de dados relacional, desenvolvido como parte do meu aprendizado em modelagem de dados e SQL. O sistema foi projetado para gerenciar informações de uma **biblioteca escolar**, incluindo livros, autores, usuários e empréstimos.

## 🎯 Objetivos

- Aplicar conceitos de modelagem de banco de dados
- Implementar relacionamentos entre entidades
- Praticar comandos SQL (DDL, DML, DQL)
- Compreender normalização de dados
- Criar consultas complexas com JOINs

## 📐 Modelo Conceitual (DER)

### Entidades Principais:

**📚 LIVRO**
- id_livro (PK)
- titulo
- isbn
- ano_publicacao
- quantidade_total
- quantidade_disponivel

**✍️ AUTOR**
- id_autor (PK)
- nome
- nacionalidade
- data_nascimento

**👤 USUARIO**
- id_usuario (PK)
- nome
- email
- telefone
- data_cadastro
- tipo_usuario (aluno/professor/funcionario)

**📖 EMPRESTIMO**
- id_emprestimo (PK)
- id_usuario (FK)
- id_livro (FK)
- data_emprestimo
- data_prevista_devolucao
- data_devolucao
- status

**🔗 LIVRO_AUTOR** (Tabela de relacionamento N:N)
- id_livro (FK)
- id_autor (FK)

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
