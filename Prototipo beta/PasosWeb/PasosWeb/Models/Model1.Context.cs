﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PasosWeb.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class dbhomemxEntities2 : DbContext
    {
        public dbhomemxEntities2()
            : base("name=dbhomemxEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<direccion> direccion { get; set; }
        public virtual DbSet<mensaje> mensaje { get; set; }
        public virtual DbSet<propiedad> propiedad { get; set; }
        public virtual DbSet<renta> renta { get; set; }
        public virtual DbSet<servicios> servicios { get; set; }
        public virtual DbSet<usuario> usuario { get; set; }
    }
}