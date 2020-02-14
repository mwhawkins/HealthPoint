/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version
 * Routes Database Model
 * */

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Globalization;
using System.Web.Security;

namespace HealthPointPlus.Models
{

    public class RoutesContext : DbContext
    {
        public RoutesContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<Routes> Routes { get; set; }
    }

    /*
     * The main Routes database model/table.
     * Stores information on routes created by users.
     * */
    public class Routes
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }        
        //public virtual UserProfile UserId { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string RouteString { get; set; }
        //public DateTime Created { get; set; }
    }
}
