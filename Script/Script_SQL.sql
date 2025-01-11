CREATE TABLE Cliente (
    id             INTEGER       PRIMARY KEY AUTOINCREMENT,
    TipoPessoa     VARCHAR (1)   NOT NULL,
    FisicaJuridica VARCHAR (1)   NOT NULL,
    NomeCompleto   VARCHAR (100) NOT NULL,
    DataNascimento DATE          NOT NULL,
    CPF            VARCHAR (20)  NOT NULL
                                 UNIQUE,
    RG             VARCHAR (20)  NOT NULL,
    Email          VARCHAR (100) NOT NULL,
    Telefone       VARCHAR (20),
    Endereco       VARCHAR (200),
    Bairro         VARCHAR (200),
    Cidade         VARCHAR (200),
    CEP            VARCHAR (20),
    numero         VARCHAR (20),
    complemento    VARCHAR (20),
    uf             VARCHAR (2) 
);

CREATE TABLE Pedido (
    id         INTEGER PRIMARY KEY,
    DataPedido DATE    NOT NULL,
    IdCliente  INTEGER REFERENCES Cliente (id) 
                       NOT NULL,
    Total      REAL
);

CREATE TABLE PedidoItens (
    id              INTEGER PRIMARY KEY,
    idPedido        INTEGER REFERENCES Pedido (id),
    Quantidade      REAL,
    idUnidadeMedida INTEGER REFERENCES UnidadeMedida (id),
    Valor           REAL    NOT NULL,
    Total           REAL    NOT NULL,
    idProduto       INTEGER REFERENCES Produtos (id) 
);
CREATE TABLE Produtos (
    id               INTEGER      PRIMARY KEY,
    idUnidadeMedida  INTEGER      REFERENCES UnidadeMedida (id),
    DataCadastro     DATE         NOT NULL,
    DescricaoProduto VARCHAR (50) NOT NULL,
    Valor            FLOAT        NOT NULL
);

CREATE TABLE UnidadeMedida (
    id                     INTEGER      PRIMARY KEY,
    DescricaoUnidadeMedida VARCHAR (50) NOT NULL,
    SiglaUnidadeMedida     VARCHAR (4)  NOT NULL,
    DataCadastro           DATE         NOT NULL
);
