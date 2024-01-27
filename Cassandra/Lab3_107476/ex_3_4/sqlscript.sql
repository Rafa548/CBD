CREATE KEYSPACE IF NOT EXISTS EventosEsportivos
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE EventosEsportivos;


DROP TABLE IF EXISTS Eventos;
DROP TABLE IF EXISTS Atletas;
DROP TABLE IF EXISTS Participacao;
DROP TABLE IF EXISTS Patrocinadores;
DROP TABLE IF EXISTS Jogos_Atleta;



CREATE TABLE IF NOT EXISTS Eventos (
    ID_evento Int PRIMARY KEY,
    Nome_evento TEXT,
    Data_inicio TIMESTAMP,
    Data_fim TIMESTAMP,
    Local TEXT,
    Descricao TEXT,
    Categorias SET<TEXT>
);

--b

INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (1, 'Jogos Olímpicos', '2021-07-23 00:00:00', '2021-08-08 00:00:00', 'Tóquio', 'Jogos Olímpicos de Tóquio 2021');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (2, 'Copa do Mundo', '2022-11-21 00:00:00', '2022-12-18 00:00:00', 'Catar', 'Copa do Mundo de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (3, 'Super Bowl', '2022-02-13 00:00:00', '2022-02-13 00:00:00', 'Los Angeles', 'Super Bowl de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (4, 'Final da Liga dos Campeões', '2022-05-28 00:00:00', '2022-05-28 00:00:00', 'São Petersburgo', 'Final da Liga dos Campeões de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (5, 'Final da Libertadores', '2022-11-20 00:00:00', '2022-11-20 00:00:00', 'Buenos Aires', 'Final da Libertadores de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (6, 'Final da NBA', '2022-06-19 00:00:00', '2022-06-19 00:00:00', 'Los Angeles', 'Final da NBA de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (7, 'Final da NFL', '2022-02-06 00:00:00', '2022-02-06 00:00:00', 'Los Angeles', 'Final da NFL de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (8, 'Final da MLB', '2022-10-26 00:00:00', '2022-10-26 00:00:00', 'Los Angeles', 'Final da MLB de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (9, 'Final da Copa América', '2022-07-10 00:00:00', '2022-07-10 00:00:00', 'Buenos Aires', 'Final da Copa América de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (10, 'Final do Euro', '2022-07-10 00:00:00', '2022-07-10 00:00:00', 'Londres', 'Final do Euro de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (11, 'Final do Mundial de Rugby', '2022-11-12 00:00:00', '2022-11-12 00:00:00', 'Paris', 'Final do Mundial de Rugby de 2022');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (12, 'Final do Mundial de Futsal', '2021-10-03 00:00:00', '2021-10-03 00:00:00', 'Lituânia', 'Final do Mundial de Futsal de 2021');
INSERT INTO Eventos (ID_evento, Nome_evento, Data_inicio, Data_fim, Local, Descricao) VALUES (13, 'Final do Mundial de Voleibol', '2022-10-16 00:00:00', '2022-10-16 00:00:00', 'Rússia', 'Final do Mundial de Voleibol de 2022');

--c

UPDATE Eventos SET Categorias = {'Futebol', 'Basquetebol', 'Futebol Americano', 'Beisebol'} WHERE ID_evento = 1;
UPDATE Eventos SET Categorias = {'Futebol'} WHERE ID_evento = 2;
UPDATE Eventos SET Categorias = {'Futebol Americano'} WHERE ID_evento = 3;
UPDATE Eventos SET Categorias = {'Futebol'} WHERE ID_evento = 4;
UPDATE Eventos SET Categorias = {'Futebol'} WHERE ID_evento = 5;
UPDATE Eventos SET Categorias = {'Basquetebol'} WHERE ID_evento = 6;
UPDATE Eventos SET Categorias = {'Futebol Americano'} WHERE ID_evento = 7;
UPDATE Eventos SET Categorias = {'Beisebol'} WHERE ID_evento = 8;
UPDATE Eventos SET Categorias = {'Futebol'} WHERE ID_evento = 9;
UPDATE Eventos SET Categorias = {'Futebol'} WHERE ID_evento = 10;
UPDATE Eventos SET Categorias = {'Râguebi'} WHERE ID_evento = 11;
UPDATE Eventos SET Categorias = {'Futsal'} WHERE ID_evento = 12;
UPDATE Eventos SET Categorias = {'Voleibol'} WHERE ID_evento = 13;

------

CREATE TABLE IF NOT EXISTS Atletas (
    ID_atleta INT PRIMARY KEY,
    Nome_atleta TEXT,
    Idade INT,
    Pais_origem TEXT,
    Modalidade TEXT,
    Linguas_faladas SET<TEXT>
) ;

--b

INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (1, 'Neymar', 29, 'Brasil', 'Futebol');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (2, 'Messi', 34, 'Argentina', 'Futebol');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (3, 'Cristiano Ronaldo', 36, 'Portugal', 'Futebol');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (4, 'LeBron James', 36, 'Estados Unidos', 'Basquetebol');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (5, 'Kevin Durant', 32, 'Estados Unidos', 'Basquetebol');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (6, 'Stephen Curry', 33, 'Estados Unidos', 'Basquetebol');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (7, 'Tom Brady', 44, 'Estados Unidos', 'Futebol Americano');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (8, 'Aaron Rodgers', 37, 'Estados Unidos', 'Futebol Americano');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (9, 'Patrick Mahomes', 25, 'Estados Unidos', 'Futebol Americano');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (10, 'Mike Trout', 29, 'Estados Unidos', 'Basebol');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (11, 'Mookie Betts', 28, 'Estados Unidos', 'Basebol');
INSERT INTO Atletas (ID_atleta, Nome_atleta, Idade, Pais_origem, Modalidade) VALUES (12, 'Christian Yelich', 29, 'Estados Unidos', 'Basebol');

--c

UPDATE Atletas SET Linguas_faladas = {'Português', 'Espanhol', 'Inglês'} WHERE ID_atleta = 1;
UPDATE Atletas SET Linguas_faladas = {'Espanhol', 'Inglês'} WHERE ID_atleta = 2;
UPDATE Atletas SET Linguas_faladas = {'Português', 'Inglês'} WHERE ID_atleta = 3;
UPDATE Atletas SET Linguas_faladas = {'Inglês'} WHERE ID_atleta = 4;
UPDATE Atletas SET Linguas_faladas = {'Inglês'} WHERE ID_atleta = 5;
UPDATE Atletas SET Linguas_faladas = {'Inglês'} WHERE ID_atleta = 6;
UPDATE Atletas SET Linguas_faladas = {'Inglês'} WHERE ID_atleta = 7;
UPDATE Atletas SET Linguas_faladas = {'Inglês'} WHERE ID_atleta = 8;
UPDATE Atletas SET Linguas_faladas = {'Inglês'} WHERE ID_atleta = 9;
UPDATE Atletas SET Linguas_faladas = {'Inglês'} WHERE ID_atleta = 10;
UPDATE Atletas SET Linguas_faladas = {'Inglês'} WHERE ID_atleta = 11;
UPDATE Atletas SET Linguas_faladas = {'Inglês'} WHERE ID_atleta = 12;

------

CREATE TABLE IF NOT EXISTS Jogos_Atleta (
    ID_evento INT,
    ID_atleta INT,
    Data_jogo TIMESTAMP,
    Resultado TEXT,
    PRIMARY KEY (ID_atleta,Data_jogo,ID_evento)
);

INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (1, 1, '2021-08-07 00:00:00', 'Vitória');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (1, 1, '2021-08-06 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (1, 1, '2021-08-03 00:00:00', 'Vitória');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (1, 2, '2021-08-07 00:00:00', 'Vitória');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (1, 2, '2021-08-03 00:00:00', 'Vitória');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (1, 2, '2021-08-07 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (1, 2, '2021-08-03 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (1, 2, '2021-08-07 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (1, 3, '2021-08-07 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (6, 4, '2021-06-18 00:00:00', 'Vitória');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (6, 5, '2021-06-18 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (6, 6, '2021-06-18 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (7, 7, '2021-02-07 00:00:00', 'Vitória');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (7, 8, '2021-02-07 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (7, 9, '2021-02-07 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (8, 10, '2021-10-26 00:00:00', 'Vitória');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (8, 11, '2021-10-26 00:00:00', 'Derrota');
INSERT INTO Jogos_Atleta (ID_evento, ID_atleta, Data_jogo, Resultado) VALUES (8, 12, '2021-10-26 00:00:00', 'Derrota');


CREATE TABLE IF NOT EXISTS Participacao (
    ID_evento INT,
    ID_atleta INT,
    Posicao INT,
    Resultado TEXT,
    Observacoes TEXT,
    Detalhes_performance MAP<TEXT, TEXT>,
    PRIMARY KEY (ID_evento, ID_atleta)
);


--b

INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (1, 1, 1, 'Ouro', 'Neymar marcou o golo do título');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (1, 2, 2, 'Prata', 'Messi marcou o golo do vice-campeão');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (1, 3, 3, 'Bronze', 'Cristiano Ronaldo marcou o golo do terceiro lugar');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (6, 4, 1, 'Ouro', 'Lebron James marcou o ponto do título');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (6, 5, 2, 'Prata', 'Kevin Durant marcou o ponto do vice-campeão');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (6, 6, 3, 'Bronze', 'Stephen Curry marcou o ponto do terceiro lugar');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (7, 7, 1, 'Ouro', 'Tom Brady marcou o touchdown do título');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (7, 8, 2, 'Prata', 'Aaron Rodgers marcou o touchdown do vice-campeão');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (7, 9, 3, 'Bronze', 'Patrick Mahomes marcou o touchdown do terceiro lugar');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (8, 10, 1, 'Ouro', 'Mike Trout marcou o ponto do título');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (8, 11, 2, 'Prata', 'Mookie Betts marcou o ponto do vice-campeão');
INSERT INTO Participacao (ID_evento, ID_atleta, Posicao, Resultado, Observacoes) VALUES (8, 12, 3, 'Bronze', 'Christian Yelich marcou o ponto do terceiro lugar');

--c

UPDATE Participacao SET Detalhes_performance = {'Golos': '1', 'Assistências': '2', 'Finalizações': '3', 'Desarmes': '4', 'Faltas': '5', 'Foras de jogo': '6', 'Cartões amarelos': '7', 'Cartões vermelhos': '8'} WHERE ID_evento = 1 AND ID_atleta = 1;
UPDATE Participacao SET Detalhes_performance = {'Golos': '1', 'Assistências': '2', 'Finalizações': '3', 'Desarmes': '4', 'Faltas': '5', 'Foras de jogo': '6', 'Cartões amarelos': '7', 'Cartões vermelhos': '8'} WHERE ID_evento = 1 AND ID_atleta = 2;
UPDATE Participacao SET Detalhes_performance = {'Golos': '1', 'Assistências': '2', 'Finalizações': '3', 'Desarmes': '4', 'Faltas': '5', 'Foras de jogo': '6', 'Cartões amarelos': '7', 'Cartões vermelhos': '8'} WHERE ID_evento = 1 AND ID_atleta = 3;
UPDATE Participacao SET Detalhes_performance = {'Pontos': '1', 'Rebotes': '2', 'Assistências': '3', 'Roubos de bola': '4', 'Bloqueios': '5', 'Faltas': '6', 'Cartões amarelos': '7', 'Cartões vermelhos': '8'} WHERE ID_evento = 6 AND ID_atleta = 4;
UPDATE Participacao SET Detalhes_performance = {'Pontos': '1', 'Rebotes': '2', 'Assistências': '3', 'Roubos de bola': '4', 'Bloqueios': '5', 'Faltas': '6', 'Cartões amarelos': '7', 'Cartões vermelhos': '8'} WHERE ID_evento = 6 AND ID_atleta = 5;
UPDATE Participacao SET Detalhes_performance = {'Pontos': '1', 'Rebotes': '2', 'Assistências': '3', 'Roubos de bola': '4', 'Bloqueios': '5', 'Faltas': '6', 'Cartões amarelos': '7', 'Cartões vermelhos': '8'} WHERE ID_evento = 6 AND ID_atleta = 6;
UPDATE Participacao SET Detalhes_performance = {'Touchdowns': '1', 'Jardas': '2', 'Passes': '3', 'Interceções': '4', 'Faltas': '5', 'Cartões amarelos': '6', 'Cartões vermelhos': '7'} WHERE ID_evento = 7 AND ID_atleta = 7;
UPDATE Participacao SET Detalhes_performance = {'Touchdowns': '1', 'Jardas': '2', 'Passes': '3', 'Interceções': '4', 'Faltas': '5', 'Cartões amarelos': '6', 'Cartões vermelhos': '7'} WHERE ID_evento = 7 AND ID_atleta = 8;
UPDATE Participacao SET Detalhes_performance = {'Touchdowns': '1', 'Jardas': '2', 'Passes': '3', 'Interceções': '4', 'Faltas': '5', 'Cartões amarelos': '6', 'Cartões vermelhos': '7'} WHERE ID_evento = 7 AND ID_atleta = 9;
UPDATE Participacao SET Detalhes_performance = {'Pontos': '1', 'Rebotes': '2', 'Assistências': '3', 'Roubos de bola': '4', 'Bloqueios': '5', 'Faltas': '6', 'Cartões amarelos': '7', 'Cartões vermelhos': '8'} WHERE ID_evento = 8 AND ID_atleta = 10;
UPDATE Participacao SET Detalhes_performance = {'Pontos': '1', 'Rebotes': '2', 'Assistências': '3', 'Roubos de bola': '4', 'Bloqueios': '5', 'Faltas': '6', 'Cartões amarelos': '7', 'Cartões vermelhos': '8'} WHERE ID_evento = 8 AND ID_atleta = 11;
UPDATE Participacao SET Detalhes_performance = {'Pontos': '1', 'Rebotes': '2', 'Assistências': '3', 'Roubos de bola': '4', 'Bloqueios': '5', 'Faltas': '6', 'Cartões amarelos': '7', 'Cartões vermelhos': '8'} WHERE ID_evento = 8 AND ID_atleta = 12;

------

CREATE TABLE IF NOT EXISTS Patrocinadores (
    ID_evento INT,
    ID_patrocinador INT,
    Nome_patrocinador TEXT,
    Nivel_patrocinio TEXT,
    Patrocinadores_favoritos LIST<TEXT>,
    PRIMARY KEY (ID_evento, ID_patrocinador)
);

--b

INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (1, 1, 'Nike', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (1, 2, 'Adidas', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (1, 3, 'Puma', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (2, 4, 'Coca-Cola', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (2, 5, 'Pepsi', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (2, 6, 'Budweiser', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (3, 7, 'Mastercard', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (3, 8, 'Visa', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (3, 9, 'American Express', 'normal');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (4, 10, 'Banco do Brasil', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (4, 11, 'Bradesco', 'Master');
INSERT INTO Patrocinadores (ID_evento, ID_patrocinador, Nome_patrocinador, Nivel_patrocinio) VALUES (4, 12, 'Itaú', 'Master');

--c

UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Nike', 'Adidas', 'Puma'] WHERE ID_evento = 1 AND ID_patrocinador = 1;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Nike', 'Adidas', 'Puma'] WHERE ID_evento = 1 AND ID_patrocinador = 2;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Nike', 'Adidas', 'Puma'] WHERE ID_evento = 1 AND ID_patrocinador = 3;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Coca-Cola', 'Pepsi', 'Budweiser'] WHERE ID_evento = 2 AND ID_patrocinador = 4;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Coca-Cola', 'Pepsi', 'Budweiser'] WHERE ID_evento = 2 AND ID_patrocinador = 5;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Coca-Cola', 'Pepsi', 'Budweiser'] WHERE ID_evento = 2 AND ID_patrocinador = 6;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Mastercard', 'Visa', 'American Express'] WHERE ID_evento = 3 AND ID_patrocinador = 7;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Mastercard', 'Visa', 'American Express'] WHERE ID_evento = 3 AND ID_patrocinador = 8;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Mastercard', 'Visa', 'American Express'] WHERE ID_evento = 3 AND ID_patrocinador = 9;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Banco do Brasil', 'Bradesco', 'Itaú'] WHERE ID_evento = 4 AND ID_patrocinador = 10;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Banco do Brasil', 'Bradesco', 'Itaú'] WHERE ID_evento = 4 AND ID_patrocinador = 11;
UPDATE Patrocinadores SET Patrocinadores_favoritos = ['Banco do Brasil', 'Bradesco', 'Itaú'] WHERE ID_evento = 4 AND ID_patrocinador = 12;

------

--d
CREATE INDEX IF NOT EXISTS ON Atletas (Modalidade);
CREATE INDEX IF NOT EXISTS ON Eventos (Nome_evento);
CREATE INDEX IF NOT EXISTS ON Eventos (Categorias);
CREATE INDEX IF NOT EXISTS ON Atletas (Linguas_faladas);
CREATE INDEX IF NOT EXISTS ON Patrocinadores (Patrocinadores_favoritos);
CREATE INDEX IF NOT EXISTS ON Participacao (Detalhes_performance);
CREATE INDEX IF NOT EXISTS ON patrocinadores (Nivel_patrocinio);

--e

UPDATE Atletas
SET Linguas_faladas = {'Chinês'}
WHERE ID_atleta = 1;

UPDATE Participacao
SET Detalhes_performance['Golos'] = '20'
WHERE ID_evento = 1 AND ID_atleta = 1;

UPDATE Patrocinadores
SET Patrocinadores_favoritos[1] = 'Banco do Brasil'
WHERE ID_evento = 1 AND ID_patrocinador = 1;

UPDATE Eventos
SET Categorias = Categorias + {'Futebol'}
WHERE ID_evento = 12;

UPDATE Eventos
SET Categorias = Categorias - {'Futsal'}
WHERE ID_evento = 12;

UPDATE Participacao
SET Detalhes_performance = Detalhes_performance + {'idk': '1'}
WHERE ID_evento = 1 AND ID_atleta = 1;

UPDATE Participacao
SET Detalhes_performance = Detalhes_performance - {'Cartões vermelhos'}
WHERE ID_evento = 1 AND ID_atleta = 3;

UPDATE Patrocinadores
SET Patrocinadores_favoritos = []
WHERE ID_evento = 1 AND ID_patrocinador = 1;

--f

--pesquisa por modalidade
SELECT * FROM Atletas WHERE Modalidade = 'Futebol';

--pesquisa por nome do evento
SELECT * FROM Eventos WHERE Nome_evento = 'Final da Copa América';


--pesquisa por categoria
SELECT * FROM Eventos WHERE Categorias CONTAINS 'Futebol' LIMIT 3;;

--numero de num_atletas por evento
SELECT ID_evento, COUNT(*) AS num_atletas
FROM Participacao
GROUP BY ID_evento;

--pesquisa por linguas falada
SELECT * FROM Atletas WHERE Linguas_faladas contains 'Inglês';

--pesquisa por Jogos de atleta por intervalo de tempo
select * from Jogos_Atleta where ID_atleta = 1 and Data_jogo > '2021-08-01 00:00:00' and Data_jogo < '2021-08-08 00:00:00';

--numero de patrocinadores por evento
SELECT ID_evento, COUNT(*) AS num_patrocinadores
FROM Patrocinadores
GROUP BY ID_evento;

--numero de eventos que o patrocinador tem o seu patrocinio como favorito
SELECT ID_evento, COUNT(*) AS num_patrocinadores_favoritos
FROM Patrocinadores
WHERE Patrocinadores_favoritos CONTAINS 'Nike';

--golos e assistencias de um atleta num evento
SELECT ID_evento,ID_atleta,Detalhes_performance['Golos'] As Golos, Detalhes_performance['Assistências'] As Assistencias
FROM Participacao
WHERE ID_evento = 1;

--numero de cartoes amarelos e vermelhos de um atleta num evento
SELECT ID_evento,ID_atleta,Detalhes_performance['Cartões amarelos'] As Cartoes_amarelos, Detalhes_performance['Cartões vermelhos'] As Cartoes_vermelhos
FROM Participacao
WHERE ID_evento = 1;

--numero de categorias de um evento
SELECT ID_evento, COUNT(*) AS num_categorias
FROM Eventos
WHERE Categorias CONTAINS 'Futebol'
Group by ID_evento;





























