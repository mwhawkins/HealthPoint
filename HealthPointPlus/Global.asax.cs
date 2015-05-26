/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * Final Version: July 26, 2013
 * Global Configuration
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Data.Entity;
using HealthPointPlus.Models;

namespace HealthPointPlus
{
   public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();     
            /**
             * These need to be included to clear any
             * remaining context from the running app.
             * We found that at times the App Cache can get corrupted 
             * and this will make sure it stays fresh.
             * */
            Database.SetInitializer<RoutesContext>(null);
            Database.SetInitializer<WaypointsContext>(null);
            Database.SetInitializer<PatientContext>(null);
            Database.SetInitializer<AppointmentContext>(null);
            Database.SetInitializer<VitalsContext>(null);
            /**
             * END ---------------------------------------------------]
             * */
            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterAuth();
        }
    }
}