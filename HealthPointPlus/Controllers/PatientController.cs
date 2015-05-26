/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version: July 26, 2013
 * Patient Controller - controls all of the 
 * patiend data portions of the application.
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DotNetOpenAuth.AspNet;
using Microsoft.Web.WebPages.OAuth;
using WebMatrix.WebData;
using HealthPointPlus.Filters;
using HealthPointPlus.Models;
using System.Web.Script.Serialization;
using System.Data;

namespace HealthPointPlus.Controllers
{
    [Authorize]
    [InitializeSimpleMembership]
    public class PatientController : Controller
    {
        //
        // GET: /Patient/
        /**
         * The default patient data page.
         * If an ActionName is present, it passes it to the 
         * view to display a message.
         * 
         * */
        public ActionResult Index(string ActionName = null)
        {
            var pContext = new PatientContext();
            var patients = from p in pContext.Patient orderby p.LastName select p;
            if (ActionName != null)
            {
                ViewBag.ActionName = ActionName;
            }
            return View(patients);
        }

        /**
         * The default (main) forms page.
         * Shows a list of all forms.
         * */
        public ActionResult Forms()
        {
            return View();
        }

        /**
         * The default vitals collection form page.
         * If an ActionName is present, it passes it to the 
         * view to display a message.
         * If PatientId != 0, then a patient is pre-selected.
         * 
         * */
        public ActionResult Vitals(int PatientId = 0, string ActionName = null)
        {
            using (var pContext = new PatientContext())
            {
                if (PatientId == 0)
                {
                    //Retrieve list of patients from the database based on PatientId
                    var patients = from m in pContext.Patient select m;
                    ViewBag.Patients = patients.ToList<Patient>();
                }
                else
                {
                    //Retrieve patient from the database based on PatientId
                    //The view expects a List<Patient> object, so we create one here
                    var patients = pContext.Patient.Find(PatientId);
                    List<Patient> patientList = new List<Patient>();
                    patientList.Add(patients);
                    ViewBag.Patients = patientList;
                }
            }
            if (ActionName != null)
            {
                //If a message is present, we pass it to the template
                ViewBag.ActionName = ActionName;
            }
            if (PatientId != 0)
            {
                //Return the patient information to the template
                ViewBag.Return = PatientId;
            }
            return View(new Vitals());
        }


        /**
         * This method collects the submitted patient Vitals
         * form, validates it and saves to the database.
         * It takes an input of the Vitals model object.
         * */
        [HttpPost]
        public ActionResult Vitals(Vitals v)
        {
            if (ModelState.IsValid)
            {
                var vContext = new VitalsContext();
                vContext.Vitals.Add(v);
                vContext.SaveChanges();
                //Reditect to the PatientId page for this vitals record
                return RedirectToAction("Details", new { ID = v.PatientId, ActionName = "vitals_added" });
            }
            else
            {
                //If an error is found, a message is displayed and the user is returned to the form
                return RedirectToAction("Vitals", new { ActionName = "vitals_error" });
            }
        }

        /**
         * This method deletes a vitals record from the database.
         * If PatientId is not 0, then it will redirect back to the 
         * patient's record with a success message.
         * */
        public ActionResult DeleteVitals(int ID, int PatientId = 0)
        {
            var vContext = new VitalsContext();
            var vitals = vContext.Vitals.Find(ID);
            vContext.Vitals.Remove(vitals);
            vContext.SaveChanges();
            if (PatientId == 0)
            {
                //Redirect to the index if no PatientId with a message
                return RedirectToAction("Index", new { ActionName = "vitals_deleted" });
            }
            else
            {
                //Redirect to Patient data page with a message
                return RedirectToAction("Details", new { ID = PatientId, ActionName = "vitals_deleted" });
            }
        }

        /**
         * This is the method to show the vitals 
         * record details for the one collection instance.
         * */
        public ActionResult VitalsDetails(int ID)
        {
            var vContext = new VitalsContext();
            var vitals = vContext.Vitals.Find(ID);
            var pContext = new PatientContext();
            var patient = pContext.Patient.Find(vitals.PatientId);
            ViewBag.Patient = patient;
            return View(vitals);
        }

        /**
         * This method accepts a POSTed form
         * from the user and creates a new patient from it.
         * It accepts a Patient model object.
         * */
        [HttpPost]
        public ActionResult AddPatient(Patient p)
        {
            try
            {
                var pContext = new PatientContext();
                pContext.Patient.Add(p);
                pContext.SaveChanges();
                //Redirect to patient list with a message
                return RedirectToAction("Index", new { ActionName = "patient_added" }); 
            }catch (Exception e){
                return RedirectToAction("Index", new { ActionName = "patient_error" }); 
            }
        }

        /*
         * The default "New Patient" form.
         * It passes an empty Patient object to
         * populate the empty form with and pass back to the 
         * server once filled out.
         * */
        public ActionResult Create()
        {
            return View(new Patient());
        }

        /**
         * The patient details.
         * This is the patient record method.
         * It displays the patient demographic information
         * as well as appointments and vitals.
         * */
        public ActionResult Details(int ID, string ActionName = null)
        {
            //Get the patient object from the database based on ID
            var pContext = new PatientContext();
            var patient = pContext.Patient.Find(ID);
            //Construct the name display format for the patient
            ViewBag.Name = patient.LastName + ", " + patient.FirstName + " " + patient.MiddleInitial;
            //Get all patient appointments to put in a list
            var aContext = new AppointmentContext();            
            var appts = from m in aContext.Appointment where m.PatientId == patient.ID orderby m.Date descending select m;
           ViewBag.Appointments = appts.ToList<Appointment>();
            //Get all patient Vitals records to display in a list
            var vContext = new VitalsContext();
            var vitals = from v in vContext.Vitals where v.PatientId == ID orderby v.Date descending select v;
            ViewBag.Vitals = vitals.ToList<Vitals>();
           if (ActionName != null)
           {
               ViewBag.ActionName = ActionName;
           }
            return View(patient);
        }

        /**
         * The patient edit method.
         * This method displays the patient edit form
         * */
        public ActionResult Edit(int ID)
        {           
                var pContext = new PatientContext();
                var patient = pContext.Patient.Find(ID);
                pContext.SaveChanges();
            //The patient name display format stored in a request object
                ViewBag.Name = patient.FirstName + " " + patient.LastName;
                return View(patient);                       
        }

        /**
         * This is the patient edit POST method.
         * It accepts a form POST from the user 
         * and updates the patient record accordingly.
         * */
        [HttpPost]
        public ActionResult Edit(Patient p)
        {
            if (ModelState.IsValid)
            {
                var pContext = new PatientContext();
                pContext.Entry(p).State = EntityState.Modified;
                pContext.SaveChanges();
                //Redirect back to the details page on success
                return RedirectToAction("Details", new { ID = p.ID });
            }
            else
            {
                return RedirectToAction("Edit", new { ID = p.ID });
            }
        }

        /**
         * This method deletes a selected patient
         * */
        public ActionResult Delete(int ID)
        {
            var pContext = new PatientContext();
            var patient = pContext.Patient.Find(ID);
            pContext.Patient.Remove(patient);
            pContext.SaveChanges();
            return RedirectToAction("Index", new { ActionName = "patient_deleted" });         
        }

        /**
         * This is the POST method to create a patient.
         * It accepts a form submission from the user
         * and then creates a new patient in the database from it.
         * */
        [HttpPost]
        public ActionResult Create(Patient p)
        {
            try
            {
                var pContext = new PatientContext();
                pContext.Patient.Add(p);
                pContext.SaveChanges();
                //Redirect to the patient list
                return RedirectToAction("Index", new { ActionName = "patient_added" }); 
            }
            catch (Exception e)
            {
                return View(p);
            }
        }

        /**
         * This method is the "New Appointment" form.
         * It creates a blank form to create new appointments.
         * */
        public ActionResult Appointment(int ID = 0)
        {
            using (var pContext = new PatientContext())
            {
                if (ID == 0)
                {
                    //If no ID, we show all patients
                    var patients = from m in pContext.Patient select m;
                    ViewBag.Patients = patients.ToList<Patient>();
                }
                else if (ID > 0)
                {
                    //If we have an ID, we only show that one patient
                    List<Patient> patients = new List<Patient>();
                    var pt = pContext.Patient.Find(ID);
                    patients.Add(pt);
                    ViewBag.Patients = patients;
                    ViewBag.Return = ID;
                }
            }
            return View(new Appointment());
        }

        /**
         * This is the Appointment form POST method.
         * It accepts a form submitted by the user and 
         * creates an Appointment in the database out of it.
         * */
        [HttpPost]
        public ActionResult Appointment(Appointment a)
        {           
            if (ModelState.IsValid)
            {
                var aContext = new AppointmentContext();
                aContext.Appointment.Add(a);
                aContext.SaveChanges();
                //Redirect to Appointment details page with a message
                return RedirectToAction("AppointmentDetails", new { ID = a.ID, ActionName = "appointment_added" });
            }
            else
            {
                return RedirectToAction("Appointment", new { ActionName = "appointment_error" });
            }
        }

        /**
         * The main appointment details page.
         * Shows all details of an Appointment record
         * */
        public ActionResult AppointmentDetails(int ID, string ActionName = null)
        {
            var aContext = new AppointmentContext();
            Appointment appt = aContext.Appointment.Find(ID);
            if (ActionName != null)
            {
                ViewBag.ActionName = ActionName;
            }
            using (var pContext = new PatientContext())
            {
                //Find the patient object for this record
                Patient p = pContext.Patient.Find(appt.PatientId);
                ViewBag.Patient = p;
            }

            return View(appt);
        }

        /**
         * This method deletes a selected appointment.
         * */
        public ActionResult DeleteAppointment(int ID, int PatientId)
        {
            var aContext = new AppointmentContext();
            Appointment appt = aContext.Appointment.Find(ID);
            aContext.Appointment.Remove(appt);
            aContext.SaveChanges();
            //Redirect to the patient details page with a message
            return RedirectToAction("Details", "Patient", new { ID = PatientId, ActionName = "appointment_deleted" });
        }
    }
}
