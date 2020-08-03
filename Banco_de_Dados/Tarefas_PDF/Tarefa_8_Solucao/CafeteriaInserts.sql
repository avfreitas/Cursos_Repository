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


INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('1', '1', '3');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('1', '2', '5');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('1', '3', '3');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('1', '4', '2');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('1', '5', '4');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('1', '6', '6');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('2', '1', '4');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('2', '2', '5');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('2', '3', '2');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('2', '4', '6');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('2', '5', '3');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('2', '6', '1');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('3', '1', '4');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('3', '2', '5');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('3', '3', '2');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('3', '4', '6');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('3', '5', '4');
INSERT INTO avaliacao (idBebida, idCaracteristica, idNivel) VALUES ('3', '6', '1');

