-- View para busca em resumo de filme
create view search_filme(Id, Nome, DataLancamento, Ranking, Capa) as
    select ID_filme, nome_filme, ano_lancamento, ranking, capa from filme;

-- Buscar Todos os filmes
select * from search_filme;

-- Busca de filmes por Categoria
select f.ID, 
f.Nome, 
f.DataLancamento, 
f.Ranking, 
f.Capa from search_filme f
inner join generos_filme gf
on f.Id = gf.fk_Filme_ID_filme
inner join genero g 
on g.ID_genero = gf.fk_Genero_ID_genero
where g.nome_genero = @Nome_genero@;

-- Buscar filmes por ordem
SELECT * FROM search_filme 
ORDER BY nome @ASC/DESC@;

-- Buscar filme por titulo
select * from search_filme
where Nome like '%@Titulo_filme@%';