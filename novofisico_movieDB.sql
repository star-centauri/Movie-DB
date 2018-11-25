CREATE TABLE Usuario (
    login TEXT PRIMARY KEY,
    senha VARCHAR(50),
    email TEXT
);

CREATE TABLE Filme (
    ID_filme INT PRIMARY KEY,
    ano_lancamento DATE,
    sinopse TEXT,
    duracao TIME,
    ranking REAL,
    capa VARCHAR(100),
    nome_filme VARCHAR(50)
);

CREATE TABLE Artista (
    ID_Artista INT PRIMARY KEY,
    P_nome_nasc VARCHAR(50),
    U_nome_nasc VARCHAR(50),
    data_nasc DATE,
    sexo CHARACTER,
    idade INT,
    biografia TEXT,
    foto VARCHAR(50),
    Artista_TIPO INT,
    P_nome_Arts VARCHAR(50),
    U_nome_Arts VARCHAR(50)
);

CREATE TABLE Genero (
    ID_genero INT PRIMARY KEY,
    nome_genero VARCHAR(20)
);

CREATE TABLE Pais (
    sigla_pais VARCHAR(4) PRIMARY KEY,
    nome_pais VARCHAR(50)
);

CREATE TABLE Estado (
    nome_estado VARCHAR(50),
    sigla_estado VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Recomendacao (
    fk_Filme_ID_filme INT,
    fk_Filme_ID_filme_ INT
);

CREATE TABLE Avaliacao (
    fk_Usuario_login VARCHAR(50),
    fk_Filme_ID_filme INT,
    nota INT,
    comentario TEXT,
    PRIMARY KEY (fk_Usuario_login, fk_Filme_ID_filme)
);

CREATE TABLE Atuacao (
    fk_Filme_ID_filme INT,
    fk_Artista_ID_Artista INT
);

CREATE TABLE Direcao (
    fk_Filme_ID_filme INT,
    fk_Artista_ID_Artista INT
);

CREATE TABLE Generos_filme (
    fk_Genero_ID_genero INT,
    fk_Filme_ID_filme INT
);

CREATE TABLE Gravado_em (
    fk_Pais_sigla_pais VARCHAR(50),
    fk_Filme_ID_filme INT
);

CREATE TABLE local_nasc_Artista_Pais_Estado (
    fk_Artista_ID_Artista INT,
    fk_Pais_sigla_pais VARCHAR(4),
    fk_Estado_sigla_estado VARCHAR(50)
);

ALTER TABLE Recomendacao ADD CONSTRAINT FK_Recomendacao_1
    FOREIGN KEY (fk_Filme_ID_filme)
    REFERENCES Filme (ID_filme)
    ON DELETE CASCADE;

ALTER TABLE Recomendacao ADD CONSTRAINT FK_Recomendacao_2
    FOREIGN KEY (fk_Filme_ID_filme_)
    REFERENCES Filme (ID_filme)
    ON DELETE CASCADE;

ALTER TABLE Generos_filme ADD CONSTRAINT FK_Generos_filme_1
    FOREIGN KEY (fk_Genero_ID_genero)
    REFERENCES Genero (ID_genero)
    ON DELETE RESTRICT;

ALTER TABLE Gravado_em ADD CONSTRAINT FK_Gravado_em_1
    FOREIGN KEY (fk_Pais_sigla_pais)
    REFERENCES Pais (sigla_pais)
    ON DELETE RESTRICT;

ALTER TABLE local_nasc_Artista_Pais_Estado ADD CONSTRAINT FK_local_nasc_Artista_Pais_Estado_1
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista)
    ON DELETE NO ACTION;

ALTER TABLE local_nasc_Artista_Pais_Estado ADD CONSTRAINT FK_local_nasc_Artista_Pais_Estado_2
    FOREIGN KEY (fk_Pais_sigla_pais)
    REFERENCES Pais (sigla_pais)
    ON DELETE RESTRICT;

ALTER TABLE local_nasc_Artista_Pais_Estado ADD CONSTRAINT FK_local_nasc_Artista_Pais_Estado_3
    FOREIGN KEY (fk_Estado_sigla_estado)
    REFERENCES Estado (sigla_estado)
    ON DELETE NO ACTION;