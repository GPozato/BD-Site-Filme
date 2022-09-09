CREATE DATABASE IF NOT EXISTS SiteFilme;
USE SiteFilme;

CREATE TABLE IF NOT EXISTS Filme(
	idFilme INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFilme VARCHAR(200) NOT NULL,
    sinopse VARCHAR(8000) NOT NULL,
    duração INT UNSIGNED NOT NULL,
    anoEstreia DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genero(
	idGenero INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeGenero VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS TipoAtuacao(
	idTipoAtuacao INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeTipoAtuacao VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pais(
	idPais INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomePais VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS GeneroFilme(
	idTipoAtuacao INT UNSIGNED NOT NULL,
    idGenero INT UNSIGNED NOT NULL,
    PRIMARY KEY(idTipoAtuacao, idGenero)
);

ALTER TABLE GeneroFilme ADD CONSTRAINT FK_GeneroFilme_TipoAtuacao
	FOREIGN KEY(idTipoAtuacao) REFERENCES TipoAtuacao(idTipoAtuacao);
    
ALTER TABLE GeneroFilme ADD CONSTRAINT FK_GeneroFilme_Genero
	FOREIGN KEY(idGenero) REFERENCES TYPES(ID);
    
CREATE TABLE IF NOT EXISTS Equipe(
	idPessoa INT UNSIGNED NOT NULL,
    idFilme INT UNSIGNED NOT NULL,
    idTipoAtuacao INT UNSIGNED NOT NULL,
    PRIMARY KEY(idPessoa, idFilme, idTipoAtuacao)
);

ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_Pessoa
	FOREIGN KEY(idPessoa) REFERENCES TYPES(ID);
    
ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_Filme
	FOREIGN KEY(idFilme) REFERENCES TYPES(ID);
    
ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_TipoAtuacao
	FOREIGN KEY(idTipoAtuacao) REFERENCES TYPES(ID);