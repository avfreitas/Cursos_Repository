
/*DDL - Data Definition Language*/

CREATE DATABASE cafeDB;

USE cafeDB;

CREATE TABLE Ingrediente (
  idIngrediente INT(11) NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  ValorCustoMilhar DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (idIngrediente) 
);

CREATE TABLE Caracteristica (
  idCaracteristica INT(11) NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Descricao TEXT,
  PRIMARY KEY (idCaracteristica) 
);

CREATE TABLE Nivel (
  idNivel INT(11) NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idNivel) 
);

CREATE TABLE Pais (
  idPais INT(11) NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (idPais) 
);

CREATE TABLE ModoPreparo (
  idModoPreparo INT(11) NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (idModoPreparo) 
);

CREATE TABLE Bebida (
  idBebida INT(11) NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Descricao TEXT,
  VolumeMin SMALLINT(6),
  VolumeMax SMALLINT(6),
  ValorVenda DECIMAL(5,2) NOT NULL,
  idPaisOrigem INT(11),
  idModoPreparo INT(11) NOT NULL,
  PRIMARY KEY (idBebida) ,
  CONSTRAINT fk_Bebida_Pais1 FOREIGN KEY (idPaisOrigem) REFERENCES Pais (idPais)
    ON DELETE SET NULL
    ON UPDATE SET NULL,
  CONSTRAINT fk_Bebida_ModoPreparo1 FOREIGN KEY (idModoPreparo) REFERENCES ModoPreparo (idModoPreparo)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

CREATE TABLE Preparo (
  idBebida INT(11) NOT NULL,
  idIngrediente INT(11) NOT NULL,
  qtdeIngrediente SMALLINT(6) NOT NULL,
  PRIMARY KEY (idBebida, idIngrediente) ,
  CONSTRAINT fk_Bebida_has_Ingrediente_Bebida FOREIGN KEY (idBebida) REFERENCES Bebida (idBebida)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Bebida_has_Ingrediente_Ingrediente1 FOREIGN KEY (idIngrediente) REFERENCES Ingrediente (idIngrediente)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Avaliacao (
  idBebida INT(11) NOT NULL,
  idCaracteristica INT(11) NOT NULL,
  idNivel INT(11) NOT NULL,
  PRIMARY KEY (idBebida, idCaracteristica) ,
  CONSTRAINT fk_Bebida_has_Caracteristica_Bebida1 FOREIGN KEY (idBebida) REFERENCES Bebida (idBebida)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Bebida_has_Caracteristica_Caracteristica1 FOREIGN KEY (idCaracteristica) REFERENCES Caracteristica (idCaracteristica)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_Avaliacao_Nivel1 FOREIGN KEY (idNivel) REFERENCES Nivel (idNivel)
);

