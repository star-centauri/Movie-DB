using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace moviedb.WebApi.Models
{
    public class MovieModel
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public List<GeneroModel> Generos { get; set; }
        public double Ranking { get; set; }
        public string Capa { get; set; }
    }
}