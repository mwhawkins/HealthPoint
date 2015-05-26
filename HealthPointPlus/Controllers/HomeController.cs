/**
 * Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * 
 * Home (main) Controller - provides the 
 * main functionality of the landing screens/webpages
 * such as about pages, help, etc.
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HealthPointPlus.Controllers
{
    public class HomeController : Controller
    {
        /**
         * The  Index controller
         * This displays the main page
         * Different content will be shown depending on
         * whether or not the user is logged in
         * */
        public ActionResult Index()
        {           
            return View();
        }
        
        /**
         * The  Navigation controller
         * This is where the routing happens
         * */
        [Authorize]        
        public ActionResult Navigation()
        {
            //TODO: Get latest route and display it
            return View();
        }

        /**
         * The  Patient Data controller
         * This is where the patient data collection happens
         * */
        [Authorize] 
        public ActionResult PatientData()
        {
            return View();
        }

        /**
         * The  Reports controller
         * This is where reports are generated
         * */
        [Authorize] 
        public ActionResult Reports()
        {
            return View();
        }

        /**
         * The  Help controller
         * This is where the public help page is displayed
         * */
        public ActionResult Help()
        {
            return View();
        }

        /**
         * The  About controller
         * Displays generic info about the team that created
         * the HealthPoint Plus application
         * */
        public ActionResult About()
        {
            return View();
        }

    }
}
