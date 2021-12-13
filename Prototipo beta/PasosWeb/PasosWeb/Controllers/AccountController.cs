using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PasosWeb.Models;
using System.Web.Security;
using System.Text;
using System.Net.Mail;
using System.Net;

namespace PasosWeb.Controllers
{
    public class AccountController : Controller
    {

        public ActionResult Login()
        {
            try
            {
                //Core.ConnectionManager GeneralManager = new Core.ConnectionManager();
                //GeneralManager.ValidateGeneralObjects(Server.MapPath("~"));
                if (Session["LoginUser"] != null)
                    Session.Clear();
                return View();
            }
            catch (Exception)
            {

                throw;
            }

        }

        [HttpPost]
        public ActionResult Login(usuario Login)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //realizar las consultas
                    PasosWeb.Models.dbhomemxEntities1 db = new dbhomemxEntities1();
            var usuarios = db.usuario.ToList();
             var usuario = usuarios.Where(x => x.correo == Login.correo).Single();



          //  var decode = Decrypt(usuario.password);
            if (Login.contraseña == usuario.contraseña)
            {
                FormsAuthentication.SetAuthCookie(Login.correo, false);
                // se crean las variables de session
               // Session["EmpresaId"] = usuario.empresa_idempresa;
                Session["LoginUser"] = usuario.correo;
                Session["IdUser"] = usuario.idusuario;
                //Session["RolUser"] = usuario.rol;
                Session["NameUser"] = usuario.nombre;
                Session["LastUser"] = usuario.apellido;


                return RedirectToAction("Index", "Home");
            }
            else
            {
              //  Login.Message = "El Usuario y/o Contraseña son incorrectos";
                return View(Login);
            }

        }
                else
                {
                    return View(Login);
    }
}
            catch (Exception)
            {
                //PasosWeb.Models.ErrorInfo error = new ErrorInfo("", "Mensajes de error", "El Error es ....");
                //return View("~/Views/Shared/ErrorWebsite.cshtml", error);
                throw;
            }
        }

        // GET: Acount/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Acount/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Acount/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Acount/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Acount/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Acount/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Acount/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public string Decrypt(string password)
        {
            string result = "";

            try
            {
                byte[] bytes = Convert.FromBase64String(password);

                result = System.Text.Encoding.UTF8.GetString(bytes);
            }
            catch { }

            return result;
        }

        public ActionResult Forgot()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Forgot(usuario user)
        {
          //  realizar las consultas
            PasosWeb.Models.dbhomemxEntities1 db = new PasosWeb.Models.dbhomemxEntities1();
            var usuarios = db.usuario.ToList();
                var usuario= usuarios.Where(x => x.correo == user.correo).Single();

            if (user.correo == usuario.correo)
            {
                var decode = Decrypt(usuario.contraseña);
                EmailUser(usuario, decode);
            }
            return RedirectToAction("Login");
        }
        public void EmailUser(PasosWeb.Models.usuario user, string password)
        {
            var users = user.nombre.ToString();
            var correo = user.correo.ToString();

            var fromAddress = new MailAddress("soportepazos@outlook.com", "Nombre de Soporte");
            var toAddress = new MailAddress(correo, "Estimado Usuario");

            const string fromPassword = "soporte_pazos$2021";
            const string subject = "Envio de Informacion Solicitada";
            string body = "<body>" +
               "<h1>Solicitud de Envío de Información</h1>" +
               "<h2>Entrega de Usuario y Contraseña</h2>" +
                "<h3>Nombre de Usuario: </h3>" + users +
                "<h3>Correo Electrónico: </h3>" + correo +
                 "<h3>Contraseña: </h3>" + password +
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
    }
}
