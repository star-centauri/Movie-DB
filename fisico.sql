/* Lógico_1: */

CREATE TABLE Filme (
    Id VARCHAR PRIMARY KEY,
    Nome VARCHAR,
    Ano DATE,
    Orcamento INTEGER,
    Bileteria INTEGER,
    Sinopse VARCHAR,
    Rank FLOAT
);

CREATE TABLE Diretor (
    Id VARCHAR PRIMARY KEY,
    Primeiro_Nome VARCHAR,
    Segundo_Nome VARCHAR,
    Sexo CHAR,
    Data_Nascimento DATE,
    Pais VARCHAR
);

CREATE TABLE Ator (
    Id VARCHAR PRIMARY KEY,
    Primeiro_Nome VARCHAR,
    Segundo_Nome VARCHAR,
    Sexo CHAR,
    Data_Nascimento DATE,
    Pais VARCHAR
);

CREATE TABLE Categoria (
    Nome VARCHAR PRIMARY KEY
);

CREATE TABLE Comentario (
    Id INTEGER PRIMARY KEY,
    Data DATE
);

CREATE TABLE Produtora (
    Nome VARCHAR PRIMARY KEY,
    Pais VARCHAR
);

CREATE TABLE Usuario (
    Id VARCHAR PRIMARY KEY,
    Primeiro_Nome VARCHAR,
    Segundo_Nome VARCHAR,
    Sexo CHAR,
    Data_Nascimento DATE,
    Pais VARCHAR
);

CREATE TABLE Possui (
    FK_Categoria_Nome VARCHAR,
    FK_Filme_Id VARCHAR
);

CREATE TABLE Produz (
    FK_Produtora_Nome VARCHAR,
    FK_Filme_Id VARCHAR
);

CREATE TABLE comentar_Usuario_Filme_Comentario (
    FK_Usuario_Id VARCHAR,
    FK_Filme_Id VARCHAR,
    FK_Comentario_Id INTEGER
);

CREATE TABLE Elenco_Diretor_Ator_Filme (
    FK_Diretor_Id VARCHAR,
    FK_Ator_Id VARCHAR,
    FK_Filme_Id VARCHAR
);
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_0
    FOREIGN KEY (FK_Categoria_Nome)
    REFERENCES Categoria (Nome)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_1
    FOREIGN KEY (FK_Filme_Id)
    REFERENCES Filme (Id)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Produz ADD CONSTRAINT FK_Produz_0
    FOREIGN KEY (FK_Produtora_Nome)
    REFERENCES Produtora (Nome)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Produz ADD CONSTRAINT FK_Produz_1
    FOREIGN KEY (FK_Filme_Id)
    REFERENCES Filme (Id)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE comentar_Usuario_Filme_Comentario ADD CONSTRAINT FK_comentar_Usuario_Filme_Comentario_0
    FOREIGN KEY (FK_Usuario_Id)
    REFERENCES Usuario (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE comentar_Usuario_Filme_Comentario ADD CONSTRAINT FK_comentar_Usuario_Filme_Comentario_1
    FOREIGN KEY (FK_Filme_Id)
    REFERENCES Filme (Id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
 
ALTER TABLE comentar_Usuario_Filme_Comentario ADD CONSTRAINT FK_comentar_Usuario_Filme_Comentario_2
    FOREIGN KEY (FK_Comentario_Id)
    REFERENCES Comentario (Id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
 
ALTER TABLE Elenco_Diretor_Ator_Filme ADD CONSTRAINT FK_Elenco_Diretor_Ator_Filme_0
    FOREIGN KEY (FK_Diretor_Id)
    REFERENCES Diretor (Id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
 
ALTER TABLE Elenco_Diretor_Ator_Filme ADD CONSTRAINT FK_Elenco_Diretor_Ator_Filme_1
    FOREIGN KEY (FK_Ator_Id)
    REFERENCES Ator (Id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
 
ALTER TABLE Elenco_Diretor_Ator_Filme ADD CONSTRAINT FK_Elenco_Diretor_Ator_Filme_2
    FOREIGN KEY (FK_Filme_Id)
    REFERENCES Filme (Id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
