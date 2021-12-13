using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PasosWeb.Controllers
{
    public class ServiciosController : Controller
    {
        PasosWeb.Models.dbhomemxEntities2 db = new PasosWeb.Models.dbhomemxEntities2();
        // GET: Servicios
        public ActionResult Index()
        {
            return View();
        }
        public int GridViewPartialAddNew(PasosWeb.Models.propiedadGeneral item)
        {
            PasosWeb.Models.servicios servicio = new Models.servicios();
            // igualar los valores o pasarle los datos

            servicio.internet = item.internet;
            servicio.comida = item.comida;
            servicio.limpieza = item.limpieza;
            servicio.amueblada = item.amueblado;
            servicio.parking = item.parking;
            servicio.alberca = item.alberca;
            servicio.clima = item.clima;
            servicio.terraza = item.terraza;
            servicio.lavanderia = item.lavanderia;

            var model = db.servicios;
            string id = DateTime.Now.ToString();
            if (ModelState.IsValid)
            {
                try
                {
                    servicio.auxiliar = id;
                    model.Add(servicio);
                    db.SaveChanges();
                }
                catch (Exception e)
                {
                    ViewData["EditError"] = e.Message;
                }
            }
            else
                ViewData["EditError"] = "Please, correct all errors.";
            var servicios = model.ToList();
            var registro = servicios.Where(x => x.auxiliar == id).Single();
            return servicio.idservicios;
        }
    }
}