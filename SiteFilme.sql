CREATE DATABASE IF NOT EXISTS SiteFilme;
USE SiteFilme;

CREATE TABLE IF NOT EXISTS Filme(
	idFilme INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFilme VARCHAR(200) NOT NULL,
    sinopse VARCHAR(8000) NOT NULL,
    duracao INT UNSIGNED NOT NULL,
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
	idFilme INT UNSIGNED NOT NULL,
    idGenero INT UNSIGNED NOT NULL,
    PRIMARY KEY(idFilme, idGenero)
);

ALTER TABLE GeneroFilme ADD CONSTRAINT FK_GeneroFilme_Filme
	FOREIGN KEY(idFilme) REFERENCES Filme(idFilme);
    
ALTER TABLE GeneroFilme ADD CONSTRAINT FK_GeneroFilme_Genero
	FOREIGN KEY(idGenero) REFERENCES Genero(idGenero);
    
CREATE TABLE IF NOT EXISTS Pessoa(
	idPessoa INT UNSIGNED AUTO_INCREMENT NOT NULL,
    nomePessoa VARCHAR(60),
    idPais INT UNSIGNED NOT NULL,
    PRIMARY KEY(idPessoa, idPais)
);

ALTER TABLE Pessoa ADD CONSTRAINT FK_Pessoa_Pais
	FOREIGN KEY(idPais) REFERENCES Pais(idPais);
    
CREATE TABLE IF NOT EXISTS Equipe(
	idPessoa INT UNSIGNED NOT NULL,
    idFilme INT UNSIGNED NOT NULL,
    idTipoAtuacao INT UNSIGNED NOT NULL,
    PRIMARY KEY(idPessoa, idFilme, idTipoAtuacao)
);

ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_Pessoa
	FOREIGN KEY(idPessoa) REFERENCES Pessoa(idPessoa);
    
ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_Filme
	FOREIGN KEY(idFilme) REFERENCES Filme(idFilme);
    
ALTER TABLE Equipe ADD CONSTRAINT FK_Equipe_TipoAtuacao
	FOREIGN KEY(idTipoAtuacao) REFERENCES TipoAtuacao(idTipoAtuacao);
    
CREATE TABLE IF NOT EXISTS PaisFilme(
	idFilme INT UNSIGNED NOT NULL,
    idPais INT UNSIGNED NOT NULL,
    PRIMARY KEY(idFilme, idPais)
);

ALTER TABLE PaisFilme ADD CONSTRAINT FK_PaisFilme_Filme
	FOREIGN KEY(idFilme) REFERENCES Filme(idFilme);

ALTER TABLE PaisFilme ADD CONSTRAINT FK_PaisFilme_Pais
	FOREIGN KEY(idPais) REFERENCES Pais(idPais);
    
INSERT INTO Genero(nomeGenero) VALUES
('A????o'),
('Aventura'),
('Drama'),
('Com??dia'),
('Fic????o Cientifica');

INSERT INTO Pais(nomePais) VALUES
('Estados Unidos'),
('Autralia'),
('Reino Unido'),
('Islandia'),
('Israel');

INSERT INTO Filme(nomeFilme, sinopse, duracao, anoEstreia) VALUES
('Velozes e Furiosos 8', 'Depois da aposentadoria de Brian e Mia, Dom e Letty aproveitam a lua de mel e levam uma vida pacata e normal. Mas a adrenalina do passado volta com tudo quando uma mulher misteriosa obriga Dom a retornar ao mundo do crime e da velocidade.',136,'2017-01-01'),
('Logan','Em 2024, os mutantes est??o em franco decl??nio, e as pessoas n??o sabem o real motivo. Uma organiza????o est?? transformando as crian??as mutantes em verdadeiras assassinas. Wolverine, cansado de tudo e a pedido de um cada vez mais enfraquecido Professor Xavier, precisa proteger a jovem e poderosa Laura Kinney, conhecida como X-23. Enquanto isso, o vil??o Nathaniel Essex amplia seu projeto de destrui????o.',137,'2017-01-01'),
('Thor, Ragnarok','Ap??s anos afastado, Thor retorna para casa e descobre que seu pai, Odin, rei de Asgard, est?? desaparecido. Ap??s encontr??-lo, ele toma conhecimento de sua irm?? mais velha, Hela, a poderosa e implac??vel deusa da morte. Com o aux??lio de Loki, ele enfrenta Hela, mas durante a batalha, Thor acaba preso em Sakaar, um planeta do outro lado do universo. Agora, ele precisa correr contra o tempo para voltar a Asgard e impedir o Ragnarok, a destrui????o de seu mundo.',130,'2017-01-01'),
('Transformes: O Ultimo Cavaleiro','O gigante Optimus Prime embarca em uma das miss??es mais dif??ceis de sua vida: encontrar, no espa??o sideral, os Quintessons, seres que possivelmente s??o os respons??veis pela cria????o da ra??a Transformers. O problema ?? que, enquanto isso, seus amigos est??o precisando de muita ajuda na Terra, j?? que uma nova amea??a alien??gena resolveu destruir toda a humanidade.',154,'2017-01-01'),
('Mulher Maravilha','Treinada desde cedo para ser uma guerreira imbat??vel, Diana Prince nunca saiu da paradis??aca ilha em que ?? reconhecida como princesa das Amazonas. Quando o piloto Steve Trevor sofre um acidente e cai em uma praia do local, ela descobre que uma guerra sem precedentes est?? se espalhando pelo mundo e decide deixar seu lar certa de que pode parar o conflito. Lutando para acabar com a guerra, Diana percebe o alcance de seus poderes e sua verdadeira miss??o na Terra.',141,'2017-01-01');

INSERT INTO Pessoa(nomePessoa, idPais) VALUES
	('Gal Gadot', 2);
    
INSERT INTO PaisFilme (idFilme, idPais) VALUES
(1, 1),
(2, 1),
(3, 1), (3, 3),
(4, 1), (4, 3),
(5, 1), (5, 2);
    
INSERT INTO GeneroFilme (idFilme, idGenero) VALUES
(1, 1),(1, 2),
(2, 1),
(3, 1),(3, 2),
(4, 1),(4, 3),
(5, 1);

UPDATE Pessoa SET
	idPais = 5
WHERE idPessoa = 1;

DELETE FROM GeneroFilme
	WHERE idFilme = 1;
DELETE FROM PaisFilme
	WHERE idFilme = 1;
DELETE FROM Filme
	WHERE idFilme = 1;