using Data;
using moviedb.WebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Threading;

namespace moviedb.WebApi.Controllers
{
    internal class ProvedorMovie
    {
        public List<MovieModel> BuscarFilmes()
        {
            List<MovieModel> filmes = new List<MovieModel>();
            var mysqlConnction = DBConnection.Instance();

            if (mysqlConnction.IsConnect())
            {
                string query = "select * from search_filme";
                var cmd = new MySqlCommand(query, mysqlConnction.Connection);
                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    filmes.Add(
                        new MovieModel
                        {
                            Id = int.Parse(reader["Id"].ToString()),
                            Nome = reader["Nome"].ToString(),
                            Ranking = Convert.ToDouble(reader["Ranking"].ToString()),
                            Capa = reader["Capa"].ToString()
                        }
                   );
                }
                reader.Close();
            }
            
            return filmes;
        }

        public List<GeneroModel> BuscarTDGeneros()
        {
            List<GeneroModel> generos = new List<GeneroModel>();
            var mysqlConnction = DBConnection.Instance();

            if (mysqlConnction.IsConnect())
            {
                string query = "select * from genero;";
                var cmd = new MySqlCommand(query, mysqlConnction.Connection);
                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    generos.Add(
                        new GeneroModel
                        {
                            Id = int.Parse(reader["ID_genero"].ToString()),
                            Nome = reader["nome_genero"].ToString()
                        }
                   );
                }
                reader.Close();
            }
            return generos;
        }

        public List<GeneroModel> BuscarGenero(int filmeId)
        {
            List<GeneroModel> generos = new List<GeneroModel>();
            var mysqlConnction = DBConnection.Instance();

            if (mysqlConnction.IsConnect())
            {
                string query = "select g.ID_genero, g.nome_genero from generos_filme gf join genero g on gf.fk_Genero_ID_genero = g.ID_genero where fk_Filme_ID_filme = " + filmeId + ";";
                var cmd = new MySqlCommand(query, mysqlConnction.Connection);
                var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    generos.Add(
                        new GeneroModel
                        {
                            Id = int.Parse(reader["ID_genero"].ToString()),
                            Nome = reader["nome_genero"].ToString()
                        }
                   );
                }
                reader.Close();
            }
            return generos;
        }
    }
}