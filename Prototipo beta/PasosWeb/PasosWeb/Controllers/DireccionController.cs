using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PasosWeb.Controllers
{
    public class DireccionController : Controller
    {
        PasosWeb.Models.dbhomemxEntities2 db = new PasosWeb.Models.dbhomemxEntities2();
        // GET: Registro
        public ActionResult Index()
        {
            return View();
        }
       // [HttpPost, ValidateInput(false)]
        public int GridViewPartialAddNew(PasosWeb.Models.propiedadGeneral item)
        {
            PasosWeb.Models.direccion direccion = new Models.direccion();
            // igualar los valores o pasarle los datos
            direccion.calle = item.calle;
            direccion.cruzamiento1 = item.cruzamientos1;
            direccion.cruzamiento2 = item.cruzamientos2;
            direccion.noExterior = item.exterior;
            direccion.localidad = item.localidad;
            direccion.entidadFed = item.estado;
            direccion.ubicacion = item.ubicacion;
            direccion.cp = item.cp;

            var model = db.direccion;
            string id = DateTime.Now.ToString();
            if (ModelState.IsValid)
            {
                try
                {
                    
                    direccion.auxiliar = id;
                    model.Add(direccion);
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
            var direcciones = model.ToList();
            var registro = direcciones.Where(x => x.auxiliar == id).Single();
            return registro.iddireccion;
        }
    
}
}