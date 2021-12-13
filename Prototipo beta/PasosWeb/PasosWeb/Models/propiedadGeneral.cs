using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PasosWeb.Models
{
    public class propiedadGeneral
    {
        //[Required(ErrorMessage = "El {0} es necesario")]
        //[Display(Name = "Usuario", Prompt = "prompt", Description = "Description", ShortName = "Corto")]
        //public string UserName { get; set; }

        //[Required(ErrorMessage = "La {0} es necesaria")]
        //[Display(Name = "Contraseña")]
        //public string Password { get; set; }

        //public string Message { get; set; }
        #region Propiedad
        public string descripcion {get; set;}
        public int numCuartos { get; set; }        
        public int espacioPersonas { get; set; }        
        public int precio { get; set; }        
        public int deposito { get; set; }  
        public DateTime fechaPublicacion { get; set; }
        public string status { get; set; }
        public string auxiliarPropiedad { get; set; }
        public string contrato { get; set; }
        #endregion

        #region Servicios
        public string auxiliarServicios { get; set; }
        public bool internet { get; set; }
        public bool comida { get; set; }
        public bool limpieza { get; set; }
        public bool amueblado { get; set; }
        public bool parking { get; set; }
        public bool alberca { get; set; }
        public bool terraza { get; set; }
        public bool clima { get; set; }
        public bool lavanderia { get; set; }
        #endregion

        # region Usuario
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string correo { get; set; }
        public string telefono { get; set; }
        #endregion

        #region Domicilio
        public string calle { get; set; }
        public string cruzamientos1 { get; set; }
        public string cruzamientos2 { get; set; }
        public string localidad { get; set; }
        public string estado { get; set; }
        public int cp { get; set; }
        #endregion

        

    }
}