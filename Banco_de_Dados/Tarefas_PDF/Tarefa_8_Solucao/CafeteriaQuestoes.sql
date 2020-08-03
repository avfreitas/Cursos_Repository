
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
					  


