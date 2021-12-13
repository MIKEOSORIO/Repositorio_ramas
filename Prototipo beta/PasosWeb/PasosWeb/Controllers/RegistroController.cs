using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PasosWeb.Controllers
{
    public class RegistroController : Controller
    {
        PasosWeb.Models.dbhomemxEntities1 db = new PasosWeb.Models.dbhomemxEntities1();
        // GET: Registro
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult GridViewPartialAddNew(PasosWeb.Models.usuario item)
        {
            var model = db.usuario;
            if (ModelState.IsValid)
            {
                try
                {
                    model.Add(item);
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            else
                ViewData["EditError"] = "Please, correct all errors.";
            //return PartialView("_CardViewPartial", model.ToList());
           return RedirectToAction("Index","PaginaPrincipal");
        }
    }
}