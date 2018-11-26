using moviedb.WebApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Threading;

namespace moviedb.WebApi.Controllers
{
    internal class ProvedorMovie
    {
        public string connstring = string.Format("Server=den1.mysql1.gear.host; database=moviedb3; UID=moviedb3; password=Py98HPH?1~e3");

        public List<MovieModel> BuscarFilmes()
        {
            List<MovieModel> filmes = new List<MovieModel>();
            MySqlConnection mysqlConnection = new MySqlConnection(connstring);

            try
            {
                mysqlConnection.Open();
                string query = "select * from search_filme";
                var cmd = new MySqlCommand(query, mysqlConnection);
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

                mysqlConnection.Close();
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            return filmes;
        }

        public List<MovieModel> BuscarFilmesPorOrdem(string order)
        {
            List<MovieModel> filmes = new List<MovieModel>();
            MySqlConnection mysqlConnection = new MySqlConnection(connstring);

            try
            {
                mysqlConnection.Open();
                string query = "SELECT * FROM search_filme ORDER BY nome "+order+";";
                var cmd = new MySqlCommand(query, mysqlConnection);
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

                mysqlConnection.Close();
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return filmes;
        }

        public List<MovieModel> BuscarFilmesPorTitulo(string title)
        {
            List<MovieModel> filmes = new List<MovieModel>();
            MySqlConnection mysqlConnection = new MySqlConnection(connstring);

            try
            {
                mysqlConnection.Open();
                string query = "select * from search_filme where Nome like '%" + title + "%';";
                var cmd = new MySqlCommand(query, mysqlConnection);
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

                mysqlConnection.Close();
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return filmes;
        }

        public List<MovieModel> BuscarFilmesPorGenero(string categoryName)
        {
            List<MovieModel> filmes = new List<MovieModel>();
            MySqlConnection mysqlConnection = new MySqlConnection(connstring);

            try
            {
                mysqlConnection.Open();
                string query = "select f.ID, f.Nome, f.DataLancamento, f.Ranking, f.Capa from search_filme f inner join generos_filme gf on f.Id = gf.fk_Filme_ID_filme inner join genero g on g.ID_genero = gf.fk_Genero_ID_genero where g.nome_genero = '" + categoryName + "';";
                var cmd = new MySqlCommand(query, mysqlConnection);
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

                mysqlConnection.Close();
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return filmes;
        }

        public List<GeneroModel> BuscarTDGeneros()
        {
            List<GeneroModel> generos = new List<GeneroModel>();
            MySqlConnection mysqlConnection = new MySqlConnection(connstring);

            try
            {
                mysqlConnection.Open();
                string query = "select * from genero;";
                var cmd = new MySqlCommand(query, mysqlConnection);
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

                mysqlConnection.Close();
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return generos;
        }

        public List<GeneroModel> BuscarGenero(int filmeId)
        {
            List<GeneroModel> generos = new List<GeneroModel>();
            MySqlConnection mysqlConnection = new MySqlConnection(connstring);

            try
            {
                mysqlConnection.Open();
                string query = "select g.ID_genero, g.nome_genero from generos_filme gf join genero g on gf.fk_Genero_ID_genero = g.ID_genero where fk_Filme_ID_filme = " + filmeId + ";";
                var cmd = new MySqlCommand(query, mysqlConnection);
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

                mysqlConnection.Close();
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            return generos;
        }
    }
}