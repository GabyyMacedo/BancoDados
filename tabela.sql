CREATE TABLE `especializacao` (
    `idespecializacao` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `descricao` VARCHAR(240),
    PRIMARY KEY (`idespecializacao`)
);

CREATE TABLE `classe` (
    `idclasse` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `descricao` VARCHAR(240),
    PRIMARY KEY (`idclasse`)
);

CREATE TABLE `pessoa` (
    `idpessoa` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `sobrenome` VARCHAR(255),
    `email` VARCHAR(128),
    `data_nascimento` DATE,
    `idclasse` INT NOT NULL,
    `idespecializacao` INT NOT NULL,

PRIMARY KEY (`idpessoa`),

FOREIGN KEY (`idespecializacao`) REFERENCES `especializacao` (`idespecializacao`),
FOREIGN KEY (`idclasse`)  REFERENCES `classe` (`idclasse`)
);


CREATE TABLE `usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `idpessoa` INT NOT NULL,
  `usuario` VARCHAR(16) NOT NULL UNIQUE,
  `senha` VARCHAR(255) NOT NULL,
  
  PRIMARY KEY(`idusuario`),
  FOREIGN KEY (`idpessoa`) REFERENCES `pessoa` (`idpessoa`)
);


INSERT INTO especializacao 
  (nome, descricao) VALUES ('Alquimista', 'Especialista em poções e elixires com propriedades mágicas e curativas');

INSERT INTO classe 
  (nome, descricao) VALUES ('Xamã', 'Especialista em comunicação com espíritos e uso de rituais antigos');

INSERT INTO especializacao 
  (nome, descricao) VALUES ('Alquimista', 'Especialista em pocoes e elixires com propriedades magicas e curativas');

