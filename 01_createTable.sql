PRAGMA foreign_keys = ON;

-- Tabela Cliente
CREATE TABLE Cliente (
    id_cliente      INTEGER PRIMARY KEY,
    nome            TEXT NOT NULL,
    telefone        TEXT,
    email           TEXT,
    tipo_cliente    TEXT
);

-- Tabela Corretor
CREATE TABLE Corretor (
    id_corretor INTEGER PRIMARY KEY,
    nome        TEXT NOT NULL,
    creci       TEXT,
    telefone    TEXT,
    email       TEXT
);

-- Tabela Imovel
CREATE TABLE Imovel (
    id_imovel       INTEGER PRIMARY KEY,
    endereco        TEXT NOT NULL,
    bairro          TEXT,
    cidade          TEXT,
    tipo_imovel     TEXT,
    area_m2         REAL,
    quartos         INTEGER,
    valor           REAL NOT NULL,
    status          TEXT,
    id_proprietario INTEGER NOT NULL,
    FOREIGN KEY (id_proprietario) REFERENCES Cliente(id_cliente)
);

-- Tabela Visita
CREATE TABLE Visita (
    id_visita   INTEGER PRIMARY KEY,
    id_cliente  INTEGER NOT NULL,
    id_imovel   INTEGER NOT NULL,
    id_corretor INTEGER NOT NULL,
    data_visita TEXT NOT NULL,
    FOREIGN KEY (id_cliente)  REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_imovel)   REFERENCES Imovel(id_imovel),
    FOREIGN KEY (id_corretor) REFERENCES Corretor(id_corretor)
);

-- Tabela Contrato
CREATE TABLE Contrato (
    id_contrato     INTEGER PRIMARY KEY,
    id_imovel       INTEGER NOT NULL,
    id_cliente_final INTEGER NOT NULL,
    id_corretor     INTEGER NOT NULL,
    tipo_contrato   TEXT NOT NULL,
    valor_total     REAL NOT NULL,
    data_contrato   TEXT NOT NULL,
    FOREIGN KEY (id_imovel)        REFERENCES Imovel(id_imovel),
    FOREIGN KEY (id_cliente_final) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_corretor)      REFERENCES Corretor(id_corretor)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    id_pagamento    INTEGER PRIMARY KEY,
    id_contrato     INTEGER NOT NULL,
    valor_pagamento REAL NOT NULL,
    forma_pagamento TEXT,
    FOREIGN KEY (id_contrato) REFERENCES Contrato(id_contrato)
);
