
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
  CONSTRAINT fk_Avaliacao_Nivel1 FOREIGN KEY (Nivel_idNivel) REFERENCES Nivel (idNivel)
);

/*DML - Data Manipulation Language*/


INSERT INTO caracteristica (Nome, Descricao) VALUES ('Corpo', 'É uma sensação causada na boca pela persistência no paladar.');
INSERT INTO caracteristica (Nome, Descricao) VALUES ('Aroma', 'São os elementos perceptíveis através do olfato.');
INSERT INTO caracteristica (Nome, Descricao) VALUES ('Acidez', 'É a sensação obtida na parte lateral da língua.');
INSERT INTO caracteristica (Nome, Descricao) VALUES ('Doçura', 'Percebida na ponta da língua, a doçura de um café pode ter grande oscilação.');
INSERT INTO caracteristica (Nome, Descricao) VALUES ('Finalização', 'É o sabor que permanece na boca após a degustação da bebida. ');
INSERT INTO caracteristica (Nome, Descricao) VALUES ('Amargor', 'Sensação obtida no meio da língua e na garganta, é o gosto produzido pela cafeína. ');

INSERT INTO nivel (Descricao) VALUES ('Muito Baixo');
INSERT INTO nivel (Descricao) VALUES ('Baixo');
INSERT INTO nivel (Descricao) VALUES ('Médio');
INSERT INTO nivel (Descricao) VALUES ('Médio Alto');
INSERT INTO nivel (Descricao) VALUES ('Alto');
INSERT INTO nivel (Descricao) VALUES ('Altíssimo');

INSERT INTO modopreparo (Descricao) VALUES ('Cafeteira');
INSERT INTO modopreparo (Descricao) VALUES ('Filtro de Papel');
INSERT INTO modopreparo (Descricao) VALUES ('Café Filtrado Gelado');
INSERT INTO modopreparo (Descricao) VALUES ('Prensa Francesa');

INSERT INTO pais (Nome) VALUES ('Brasil');
INSERT INTO pais (Nome) VALUES ('Itália');
INSERT INTO pais (Nome) VALUES ('Colombia');
INSERT INTO pais (Nome) VALUES ('África');

INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Café - Arábica', '44.00');
INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Café - Robusta', '40.00');
INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Café - Bourbon', '43.00');
INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Café - Catuaí', '29.00');
INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Café - Mundo Novo', '31.00');
INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Leite', '4.00');
INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Espuma de Leite', '19.00');
INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Leite Vaporizado', '24.00');
INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Calda de Chocolate', '26.00');
INSERT INTO ingrediente (Nome, ValorCustoMilhar) VALUES ('Água Quente', '6.00');

INSERT INTO bebida (Nome, Descricao, VolumeMin, VolumeMax, ValorVenda, idModoPreparo) 
VALUES ('Espresso', ' É mais encorpado, pois o contato com a água durante sua extração é rápido e, por isso, seus óleos essenciais estão mais presentes.', '25', '35', '4.50', '4');
INSERT INTO bebida (Nome, Descricao, VolumeMin, VolumeMax, ValorVenda, idPaisOrigem, idModoPreparo) 
VALUES ('Café com Leite', 'Trata-se do café filtrado com leite aquecido ou fervido.', '150', '180', '6.00', '1', '2');
INSERT INTO bebida (Nome, Descricao, VolumeMin, VolumeMax, ValorVenda, idPaisOrigem, idModoPreparo) 
VALUES ('Cappuccino Italiano', 'Denso e cremoso, sendo no Brasil normal adição de canela ou chocolate.', '150', '180', '12.00', '2', '4');
INSERT INTO bebida (Nome, Descricao, VolumeMin, VolumeMax, ValorVenda, idModoPreparo) 
VALUES ('Café Cortado', 'É conhecido como Latte ou Café Latte.', '150', '180', '10.00', '4');
INSERT INTO bebida (Nome, Descricao, VolumeMin, VolumeMax, ValorVenda, idPaisOrigem, idModoPreparo) 
VALUES ('Café Filtrado', 'Café concentrado, que é filtrado e servido em pequenas doses.', '50', '50', '4.00', '1', '3');

	
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('1', '5', '50');
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('2', '1', '80');
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('2', '6', '80');
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('3', '7', '65');
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('3', '9', '65');
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('3', '2', '65');
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('4', '7', '30');
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('4', '8', '90');
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('4', '3', '60');
INSERT INTO preparo (idBebida, idIngrediente, qtdeIngrediente) VALUES ('5', '1', '50');


INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('1', '1', '3');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('1', '2', '5');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('1', '3', '3');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('1', '4', '2');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('1', '5', '4');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('1', '6', '6');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('2', '1', '4');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('2', '2', '5');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('2', '3', '2');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('2', '4', '6');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('2', '5', '3');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('2', '6', '1');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('3', '1', '4');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('3', '2', '5');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('3', '3', '2');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('3', '4', '6');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('3', '5', '4');
INSERT INTO avaliacao (idBebida, idCaracteristica, Nivel_idNivel) VALUES ('3', '6', '1');

/*Elabora uma query que seja capaz de responder cada uma das perguntas abaixo:*/

/*Quantos ingredientes existem cadastrados no banco de dados?*/
SELECT COUNT(*) FROM ingrediente;

/*Quantos modos de preparo existem cadastrados no banco de dados?*/
SELECT COUNT(*) FROM modoPreparo;

/*Quantas bebidas existem cadastradas no banco de dados que custam acima de R$ 5,00?*/
SELECT COUNT(*) FROM Bebida
WHERE ValorVenda > 5.00;

/*Qual a média do preço de venda das bebibas?*/
SELECT ROUND(AVG(ValorVenda),2) FROM Bebida;

/*Quais são os ingredientes utilizados para produção das bebidas 2 e 3? A listagem deve conter código e descrição do ingrediente.*/

SELECT i.idIngrediente, i.Nome 
FROM ingrediente i
INNER JOIN Preparo p ON p.idIngrediente = i.idIngrediente AND p.idBebida IN (2,3);

/*Qual é a avaliação registrada do Cappuccino Italiano (3)? A listagem deve constar o código da bebida, nome, código da caracteristica, nome, código e nível atribuido*/

SELECT b.idBebida, b.nome, a.idCaracteristica, c.Nome, a.idNivel, n.Descricao
FROM bebida b
INNER JOIN Avaliacao a ON a.idBebida = b.idBebida
INNER JOIN Caracteristica c ON c.idCaracteristica = a.idCaracteristica
INNER JOIN Nivel n ON n.idNivel = a.idNivel
WHERE b.idBebida = 3;

/*Quais são as bebibdas que possuem valor de venda entre R$ 4,25 e R$ 13,50? Exiba o código da bebida, nome, valor de venda, código do pais de origem, nome do pais caso seja vinculado a bebibda , o código do modo de preparo e sua descrição. Esta listagem deve ser ordenada por ordem do valor de venda da bebiba.*/

SELECT b.idBebida, b.Nome, b.ValorVenda, 
	   b.idPaisOrigem, p.Nome, b.idModoPreparo, mp.Descricao
FROM Bebida b
LEFT JOIN Pais p ON p.idPais = b.idPaisOrigem
INNER JOIN ModoPreparo mp ON mp.idModoPreparo = b.idModoPreparo 
WHERE b.ValorVenda BETWEEN 4.25 AND 13.50
ORDER BY b.ValorVenda

/*Qual o total de bebidas cadastradas por modo de preparo? Exibir o códido do modo de preparo, descrição e total de bebibas vinculadas. A listagem deve ser ordenada por ordem decrescente do total de bebidas.*/

SELECT mp.idModoPreparo, mp.Descricao, COUNT(b.idModoPreparo) FROM ModoPreparo mp
LEFT JOIN bebida b ON b.idModoPreparo = mp.idModoPreparo
GROUP BY mp.idModoPreparo
ORDER BY COUNT(b.idModoPreparo) DESC

/*Qual o total de bebidas cadastradas por pais de origem? Exibir o códido do pais, nome e total de bebibas vinculadas. Bebidas que não possuem pais registrado devem ser também devem ser contabilizadas.*/

SELECT b.idPaisOrigem, p.Nome, COUNT(*) FROM bebida b
LEFT JOIN Pais p ON p.idPais = b.idPaisOrigem
GROUP BY b.idPaisOrigem;


/*Qual o total de bebidas agrupadas por modo de preparo que custam mais do que R$ 4,25? Essa listagem deve conter o código do modo de preparo, descrição e total*/

SELECT mp.idModoPreparo, mp.Descricao, COUNT(b.idModoPreparo) 
FROM ModoPreparo mp 
LEFT JOIN Bebida b ON b.idModoPreparo = mp.idModoPreparo AND b.ValorVenda > 4.25
GROUP BY mp.idModoPreparo


/*Qual o valor de venda e o valor de produção de cada uma das bebidas registradas no banco de dados? Exibir código da bebida, nome, valor de venda e custo de produção*/

SELECT b.idBebida, b.Nome, b.ValorVenda, SUM((i.ValorCustoMilhar / 1000) * p.qtdeIngrediente)
FROM Bebida b
INNER JOIN Preparo p ON p.idBebida = b.idBebida
INNER JOIN Ingrediente i ON i.idIngrediente = p.idIngrediente
GROUP BY b.idBebida, b.Nome, b.ValorVenda

/*Quais os ingredientes que não estão sendo utilizados? Listar código e nome do ingrediente*/
SELECT i.idIngrediente, i.Nome 
FROM Ingrediente i 
WHERE NOT EXISTS (SELECT * FROM Preparo p WHERE p.idIngrediente = i.idIngrediente);

/*Quais os ingredientes que estão sendo utilizados? Listar código e nome do ingrediente*/
SELECT i.idIngrediente, i.Nome 
FROM Ingrediente i 
WHERE NOT EXISTS (SELECT * FROM Preparo p WHERE p.idIngrediente = i.idIngrediente);

/*Quais são as bebibas que possuem o nível de amargor (6) muito baixo (1)? A listagem deve conter código da bebida e nome. Para resolução deste problema você deve utilizar o operador IN*/

SELECT  b.idBebida, b.Nome 
FROM bebida b
WHERE b.idBebida IN (SELECT a.idBebida FROM Avaliacao a
					  WHERE a.idCaracteristica = 6  AND a.idNivel = 1);
					  
/*Quais as bebidas possuem a quantidade de ingredientes maior ou igual a 2? A listagem deve conter código da bebida e nome, ordenados pela quantidade de ingredientes em ordem decrescente.*/
					  
SELECT  b.idBebida, b.Nome, COUNT(*) 
FROM bebida b
INNER JOIN Preparo p ON p.idBebida = b.idBebida
GROUP BY b.idBebida
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC
					  


