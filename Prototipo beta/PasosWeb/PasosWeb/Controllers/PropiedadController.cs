using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace PasosWeb.Controllers
{
    public class PropiedadController : Controller
    {
        // GET: Propiedad
        public ActionResult Index()
        {

            int idpropiedad = (int)Session["idpropiedad"];
            PasosWeb.Models.dbhomemxEntities1 model = new Models.dbhomemxEntities1();
            var propiedad = model.propiedad.Where(x=>x.idpropiedad== idpropiedad).Single();
            #region consultas
            // se localizan las tablas relacionadas

            var servicios = model.servicios.Where(x => x.idservicios == propiedad.idservicios).Single();
            var direccion = model.direccion.Where(x => x.iddireccion == propiedad.iddireccion).Single();
            var imagen = model.imagen.Where(x => x.idimage == propiedad.idimagen).ToList();

            
            foreach (PasosWeb.Models.imagen img in imagen){
                
            }

            var usuario = model.usuario.Where(x => x.idusuario == propiedad.idusuario).Single();
            #endregion
            #region rellenar
            // se llena la tabla PropiedadGeneral
            PasosWeb.Models.propiedadGeneral resumen = new Models.propiedadGeneral();
            resumen.descripcion = propiedad.descripcion;
            resumen.numCuartos = propiedad.numCuartos;
            resumen.espacioPersonas = propiedad.espacioPersonas;
            resumen.precio = propiedad.precio;
            resumen.deposito = propiedad.deposito;
            resumen.fechaPublicacion = (DateTime)propiedad.fechaAlta;
            resumen.status = propiedad.status;
            resumen.contrato = propiedad.contrato;
            // se llena la tabla servicios
            resumen.internet = (Boolean)servicios.internet;
            resumen.comida = (Boolean)servicios.comida;
            resumen.limpieza = (Boolean)servicios.limpieza;
            resumen.amueblado = (Boolean)servicios.amueblada;
            resumen.parking = (Boolean)servicios.parking;
            resumen.alberca = (Boolean)servicios.alberca;
            resumen.clima = (Boolean)servicios.clima;
            resumen.terraza = (Boolean)servicios.terraza;
            resumen.lavanderia = (Boolean)servicios.lavanderia;
            // se llena la tabla usuario
            resumen.nombre = usuario.nombre;
            resumen.apellido = usuario.apellido;
            resumen.correo = usuario.correo;
            resumen.telefono = usuario.telefono;
            // se llena la tabla direccion
            resumen.calle = direccion.calle;
            resumen.cruzamientos1 = direccion.cruzamiento1;
            resumen.cruzamientos2 = direccion.cruzamiento2;
            resumen.localidad = direccion.localidad;
            resumen.estado = direccion.entidadFed;
            resumen.cp = direccion.cp;
            #endregion
            Session["resumen"] = resumen;
            //Session["imagen"] = imagen;
            return View();
        }
    }
}