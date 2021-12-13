using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PasosWeb.Controllers.Filters
{
    public class VerifySesion : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                base.OnActionExecuting(filterContext);
                if (HttpContext.Current.Session["LoginUser"] == null)
                {
                    // verificar el resultado bool
                    if (filterContext.Controller is AccountController == false)
                    {
                        filterContext.HttpContext.Response.Redirect("~/PaginaPrincipal");
                    }

                }
            }
            catch (Exception)
            {

                throw new Exception("Hubo un error con la verificación de la Sesion");
            }

        }
    }
}