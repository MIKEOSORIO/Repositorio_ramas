using DevExpress.Web.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PasosWeb.Controllers {
    public class HomeController : Controller {
        
        public ActionResult Index() {
           
            if (Session["IdUser"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "PaginaPrincipal");
            }
        }

        PasosWeb.Models.dbhomemxEntities1 db = new PasosWeb.Models.dbhomemxEntities1();

        [ValidateInput(false)]
        public ActionResult CardViewPartial()
        {
            var model = db.propiedad;
            return PartialView("_CardViewPartial", model.ToList());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult CardViewPartialAddNew(PasosWeb.Models.propiedad item)
        {
            var model = db.propiedad;
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
            return PartialView("_CardViewPartial", model.ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult CardViewPartialUpdate(PasosWeb.Models.propiedad item)
        {
            var model = db.propiedad;
            if (ModelState.IsValid)
            {
                try
                {
                    var modelItem = model.FirstOrDefault(it => it.idpropiedad == item.idpropiedad);
                    if (modelItem != null)
                    {
                        this.UpdateModel(modelItem);
                        db.SaveChanges();
                    }
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            else
                ViewData["EditError"] = "Please, correct all errors.";
            return PartialView("_CardViewPartial", model.ToList());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult CardViewPartialDelete(System.Int32 idpropiedad)
        {
            Session["idpropiedad"]= (int)idpropiedad;
            return RedirectToAction("Index", "Propiedad");
        }
    }
}