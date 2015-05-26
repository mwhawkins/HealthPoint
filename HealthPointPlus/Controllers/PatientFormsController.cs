/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version: July 26, 2013
 * Patient Form List Controller -
 * Displays a list (table) of available patient forms
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HealthPointPlus.Controllers
{
    public class PatientFormsController : Controller
    {
        //
        // GET: /PatientForms/
        /**
         * Displays a list of patient forms
         * */
        public ActionResult Index()
        {
            return View();
        }

    }
}
