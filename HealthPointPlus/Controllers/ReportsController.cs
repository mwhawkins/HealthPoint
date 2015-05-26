/**
 * Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 *  Reports Controller - displays all report pages and functions
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
    [Authorize] //Lock down the controller, require credentials to view actions
    [InitializeSimpleMembership]
    public class ReportsController : Controller
    {
        //
        // GET: /Reports/
        /**
         * Displays the main reports page.
         * */
        public ActionResult Index()
        {
            return View();
        }

        /**
         * The Overdue Follow-Up Appointments Report
         * Queries the database for patients overdue for follow-up appointments
         * and provides a table listing all patients with overdue appointments.
         * */
        //GET: /Reports/OverdueAppointmentReport
        public ActionResult OverdueAppointmentReport()
        {
            AppointmentContext aContext = new AppointmentContext();
            PatientContext pContext = new PatientContext();
            //Find all appointments with follow-up date less than or equal to today's date/time
            var apptsDue = from a in aContext.Appointment where a.NextFollowup <= DateTime.Now select a;
            Dictionary<int, Patient> patientsWithAppts = new Dictionary<int, Patient>();
            //Add the patient objects to go with the appointments.
            foreach (Appointment appt in apptsDue){
                Patient p = pContext.Patient.Find(appt.PatientId);
                if (!patientsWithAppts.ContainsKey(p.ID))
                {
                    patientsWithAppts.Add(p.ID, p);
                }
            }

            //Add Patient and Appointment objects to the ViewBag for this request
            ViewBag.Patients = patientsWithAppts;
            ViewBag.Appointments = apptsDue;
            return View();
        }

        /**
         * The routes report method.
         * Provides a generic report on various route/waypoint stats
         * of use to users.         
         * */
        public ActionResult RoutesReport()
        {
            RoutesContext rContext = new RoutesContext();
            WaypointsContext wContext = new WaypointsContext();

            var userRoutes = from r in rContext.Routes where r.UserId == WebSecurity.CurrentUserId select r;
            Dictionary<Routes, List<Waypoints>> routes = new Dictionary<Routes, List<Waypoints>>();
            Dictionary<Routes, double> routeDistances = new Dictionary<Routes, double>();
            int wptCount = 0;
            double miles = 0.0;
            foreach (Routes rts in userRoutes)
            {
                //Yes, this is not very efficient.  However, until I completely understand how
                // Linq casting works and I don't often use C# in general, 
                //this was the best solution I could find given the time constrain for this project.
                var wpts = from wpt in wContext.Waypoints where wpt.RouteId == rts.ID select wpt;
                List<Waypoints> wptList = new List<Waypoints>();
                foreach (Waypoints wp in wpts)
                {
                    wptList.Add(wp);
                    wptCount++;
                }
                routes.Add(rts, wptList);
            }

            //Calculate rough distances using Haversine formula.
            //Ultimately, I would prefer to use the Google API to get actual distance measurements,
            //however, on the free version, it would cause too many calls and get us blocked.
            double totalDistance = 0.0;
            foreach (KeyValuePair<Routes, List<Waypoints>> kvp in routes)
            {
                double distance = 0.0;
                for (int i = 0; i <= kvp.Value.Count; i ++)
                {
                    Waypoints origin = kvp.Value.ElementAtOrDefault(i);
                    Waypoints dest = kvp.Value.ElementAtOrDefault(i + 1);
                    if (dest != null && origin != null)
                    {
                        LatLng org = new LatLng(Double.Parse(origin.Lat), Double.Parse(origin.Lng));
                        LatLng des = new LatLng(Double.Parse(dest.Lat), Double.Parse(dest.Lng));
                        try
                        {
                            distance += HaversineDistance(org, des, DistanceUnit.Miles);
                        }
                        catch (Exception e)
                        {
                            //skip
                        }
                    }
                }
                totalDistance += distance;
                routeDistances.Add(kvp.Key, distance);
            }

            ViewBag.TotalDistance = totalDistance;
            ViewBag.RouteDistances = routeDistances;
            ViewBag.Routes = routes;
            ViewBag.WaypointCount = wptCount;

            return View();
        }

        /**
         * The haversine distance formula.
         * Takes two LatLng postions and a distance unit to compute their distance apart
         * */
        public double HaversineDistance(LatLng pos1, LatLng pos2, DistanceUnit unit)
        {
            double R = (unit == DistanceUnit.Miles) ? 3960 : 6371;
            var lat = (pos2.Latitude - pos1.Latitude) * Math.PI / 180;
            var lng = (pos2.Longitude - pos1.Longitude) * Math.PI/180;
            var h1 = Math.Sin(lat / 2) * Math.Sin(lat / 2) +
                          Math.Cos(pos1.Latitude * Math.PI / 180) * Math.Cos(pos2.Latitude * Math.PI / 180) *
                          Math.Sin(lng / 2) * Math.Sin(lng / 2);
            var h2 = 2 * Math.Asin(Math.Min(1, Math.Sqrt(h1)));
            return R * h2;
        }
        //Distance metric selection enum
        public enum DistanceUnit { Miles, Kilometers };

    }

    /*
     * A helper class to store LatLng variables
     * */
    public class LatLng
    {
        public double Latitude { get; set; }
        public double Longitude { get; set; }

        public LatLng()
        {
        }

        public LatLng(double lat, double lng)
        {
            this.Latitude = lat;
            this.Longitude = lng;
        }
    }
}
