

-- Criação da Base de Dados (caso ainda não exista)
ATTACH DATABASE 'BaseDeDados.db' AS BaseDeDados;

CREATE TABLE Cliente (
    id             INTEGER       PRIMARY KEY AUTOINCREMENT,  -- ID único para cada cliente, auto incrementado
    TipoPessoa     VARCHAR (1)   NOT NULL,                    -- Tipo de pessoa (Física ou Jurídica), não pode ser nulo
    FisicaJuridica VARCHAR (1)   NOT NULL,                    -- Indica se a pessoa é Física ou Jurídica, não pode ser nulo
    NomeCompleto   VARCHAR (100) NOT NULL,                    -- Nome completo do cliente, não pode ser nulo
    DataNascimento DATE          NOT NULL,                    -- Data de nascimento do cliente, não pode ser nulo
    CPF            VARCHAR (20)  NOT NULL UNIQUE,             -- CPF do cliente, único, não pode ser nulo
    RG             VARCHAR (20)  NOT NULL,                    -- RG do cliente, não pode ser nulo
    Email          VARCHAR (100) NOT NULL,                    -- E-mail do cliente, não pode ser nulo
    Telefone       VARCHAR (20),                              -- Telefone do cliente (opcional)
    Endereco       VARCHAR (200),                             -- Endereço do cliente (opcional)
    Bairro         VARCHAR (200),                             -- Bairro do cliente (opcional)
    Cidade         VARCHAR (200),                             -- Cidade do cliente (opcional)
    CEP            VARCHAR (20),                              -- CEP do cliente (opcional)
    numero         VARCHAR (20),                              -- Número do endereço (opcional)
    complemento    VARCHAR (20),                              -- Complemento do endereço (opcional)
    uf             VARCHAR (2)                                -- UF (Estado) do cliente (opcional)
);