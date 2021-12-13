using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace PasosWeb.Models
{
    public class ErrorInfo
    {
        [Required(ErrorMessage = "El {0} es nesesario")]
        [Display(Name = "Código")]
        public string Code { get; set; }

        [Required(ErrorMessage = "El {0} es nesesario")]
        [Display(Name = "Mensaje")]
        public string Message { get; set; }

        [Required(ErrorMessage = "El {0} es nesesario")]
        [Display(Name = "Descripción")]
        public string Description { get; set; }

        public ErrorInfo(string code, string message, string description)
        {
            Code = code;
            Message = message;
            Description = description;
        }

        public void setError(string Code, string Message, string Description)
        {
            this.Code = Code; this.Message = Message; this.Description = Description;
        }
    }
}