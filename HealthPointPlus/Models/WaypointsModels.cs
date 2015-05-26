/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version: July 26, 2013
 * Waypoints Database Model
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

    public class WaypointsContext : DbContext
    {
        public WaypointsContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<Waypoints> Waypoints { get; set; }
    }
        
    /*
     * The main Waypoints database object/table.
     * Stores information on all collected waypoints.
     * Waypoints are assigned to a Route with a Foreign Key 
     * (not represented here but in the database due to limitations experienced with conflicting models).
     * */
    public class Waypoints
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        public int RouteId { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Lat { get; set; }
        public string Lng { get; set; }
        public int Order { get; set; }        
    }
}