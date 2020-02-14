/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version
 * Patient Database Model
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
    public class PatientContext : DbContext
    {
        public PatientContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<Patient> Patient { get; set; }
    }

    public class AppointmentContext : DbContext
    {
        public AppointmentContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<Appointment> Appointment { get; set; }
    }

    public class VitalsContext : DbContext
    {
        public VitalsContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<Vitals> Vitals { get; set; }
    }

    /*
     * The main patient database model/table
     * Stores information on each patient
     * added by users of the system.
     * */
    public class Patient
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        public string FirstName { get; set; }
        public string MiddleInitial { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public DateTime DOB { get; set; }
        [Required]
        [DataType(DataType.MultilineText)]
        public string Address { get; set; }
        [Required]
        public string Phone { get; set; }
        [DataType(DataType.MultilineText)]
        public string Allergies { get; set; }
        public Decimal Height { get; set; }
        public Decimal Weight { get; set; }
        [DataType(DataType.MultilineText)]
        public string MedicalHistory { get; set; }
        public string EmergencyContact { get; set; }
        [DataType(DataType.MultilineText)]
        public string CurrentMedications { get; set; }
    }

    /**
     * The main Vitals database model/table
     * Stores information on collected Vitals.
     * Vitals are assigned to each patient with a 
     * foreign key.
     * */
    public class Vitals
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        public int PatientId { get; set; }
        [Required]
        public int Pulse { get; set; }
        public int RespiratoryRate { get; set; }
        public Decimal BodyTemperature { get; set; }
        public string BloodPressure { get; set; }
        public DateTime Date { get; set; }
    }

    /*
     * The main Appointment model.
     * Stores information on collected Appointment
     * information input by users.    
     * Appointments are assigned to each patient
     * with a foreign key.
     * */
    public class Appointment
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        public int PatientId { get; set; }
        [Required]
        public DateTime Date { get; set; }
        [Required]
        public int Duration { get; set; }
        [DataType(DataType.MultilineText)]
        public string Assessment { get; set; }
        public string DiagnosisCode { get; set; }
        [DataType(DataType.MultilineText)]
        public string LabsRequested { get; set; }
        [DataType(DataType.MultilineText)]
        public string TreatmentPlan { get; set; }
        [DataType(DataType.MultilineText)]
        public string PatientNotes { get; set; }
        public DateTime NextFollowup { get; set; }
    }


}
