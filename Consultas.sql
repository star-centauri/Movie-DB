SELECT ID_filme FROM  Genero G INNER JOIN  Genero_filme GI ON GI.fk_Genero_ID_genero = G.ID_genero Gen INNER JOIN Filme F ON F.ID_filme = Gen.fk_Filme_ID_filme where nome_genero= ’nome do genero que eu quero’ ORDER BY ranking; // na hora de mostrar no site, só precisaremos do id do filme pra pegar as infos dele.
SELECT nome_filme FROM Filme ORDER BY nome ASC;
SELECT duracao FROM Filme where ID_filme=;
SELECT capa, sinopse FROM Filme;
SELECT * FROM Artista WHERE nome = &NomeRequisitado;
SELECT  * FROM Artista A INNER JOIN (SELECT * FROM Local_nasc_Artista_Pais_Estado C INNER JOIN Pais P ON P.sigla_pais=C.fk_Pais_sigla_pais) P ON P.fk_Artista_ID_Artista=A.ID_Artista;
SELECT * FROM Filme F INNER JOIN (SELECT * FROM Atuacao A INNER JOIN Artista P ON P.ID_Artista=A.fk_Artista_ID_Artista and P.ID_Artista=&idArtistaRequisitado) A ON A.fk_Filme_ID_filme=F.ID_filme  ORDER BY ranking;
