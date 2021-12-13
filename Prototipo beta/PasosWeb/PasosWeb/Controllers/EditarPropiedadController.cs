using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PasosWeb.Controllers
{
    public class EditarPropiedadController : Controller
    {
        PasosWeb.Models.dbhomemxEntities2 db = new PasosWeb.Models.dbhomemxEntities2();
        // GET: EditarPropiedad
        public ActionResult Index()
        {

            if (Session["IdUser"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "PaginaPrincipal");
            }

        }
        [ValidateInput(false)]
        public ActionResult CardViewPartial()
        {
            var properties = db.propiedad.ToList();
            return PartialView("_CardViewPartial", properties.Where(x => x.idusuario == (int)Session["IdUser"]).ToList());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult CardViewPartialDelete(System.Int32 idpropiedad)
        {
            var model = db.propiedad;
            if (idpropiedad >= 0)
            {
                try
                {
                    var item = model.FirstOrDefault(it => it.idpropiedad == idpropiedad);
                    if (item != null)
                        model.Remove(item);
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            return PartialView("_CardViewPartial", model.ToList().Where(x => x.idusuario == (int)Session["IdUser"]));
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
            return PartialView("_CardViewPartial", model.ToList().Where(x => x.idusuario == (int)Session["IdUser"]));
        }
    }
}