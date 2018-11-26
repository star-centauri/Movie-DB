using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace moviedb.WebApi.Controllers
{
    public class MovieController : Controller
    {
        public JsonResult SearchMovie()
        {
            var _repository = new ProvedorMovie();
            var filmes = _repository.BuscarFilmes();

            foreach (var filme in filmes)
            {
                filme.Generos = _repository.BuscarGenero(filme.Id);
            }

            return Json(filmes, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SearchCategory() 
        {
            var _repository = new ProvedorMovie();

            return Json(_repository.BuscarTDGeneros(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult SearchMovieCategory(string categoryName)
        {
            var _repository = new ProvedorMovie();
            var filmes = _repository.BuscarFilmesPorGenero(categoryName);

            foreach (var filme in filmes)
            {
                filme.Generos = _repository.BuscarGenero(filme.Id);
            }

            return Json(filmes, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SearchMovieSort(string order)
        {
            var _repository = new ProvedorMovie();
            var filmes = _repository.BuscarFilmesPorOrdem(order);

            foreach (var filme in filmes)
            {
                filme.Generos = _repository.BuscarGenero(filme.Id);
            }

            return Json(filmes, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SearchMovieTitle(string title)
        {
            var _repository = new ProvedorMovie();
            var filmes = _repository.BuscarFilmesPorTitulo(title);

            foreach (var filme in filmes)
            {
                filme.Generos = _repository.BuscarGenero(filme.Id);
            }

            return Json(filmes, JsonRequestBehavior.AllowGet);
        }
    }
}