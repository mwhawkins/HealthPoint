/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version: July 26, 2013
 * Routes Controller - controls all routing and waypoint
 * functionality in the application
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

namespace HealthPointPlus.Controllers
{
    [Authorize] //Lock down the controller, require credentials to view
    [InitializeSimpleMembership]
    public class RoutesController : Controller
    {
        //
        // GET: /Routes/
        /**
         * Displays the Routes main page
         * */
        public ActionResult Index()
        {
            return View();
        }

        /**
         * Displays the "Add Waypoints" main page
         * */
        public ActionResult AddWaypoints()
        {
            return View();
        }

        /*
         * Deletes the selected route and all waypoints associated with it.
         * Users can only delete the routes they created/own.
         * */
        public ActionResult DeleteRoute()
        {
            var context = new RoutesContext();
            var wpContext = new WaypointsContext();
            int rid = int.Parse(Request.Params.Get(0));
            Routes rt = context.Routes.Find(rid);
            //One final check to make sure the user is authorized to delete this route
            if (WebSecurity.CurrentUserId == rt.UserId)
            {
                //Delete waypoints. We could do this in a database CASCADE, but we found that it sometimes didn't trigger properly.
                var waypointsInRoute = from m in wpContext.Waypoints where m.RouteId == rt.ID select m;
                foreach (Waypoints wp in waypointsInRoute)
                {
                    wpContext.Waypoints.Remove(wp);
                }

                wpContext.SaveChanges();
                context.Routes.Remove(rt);
                context.SaveChanges();
                //Redirect to the route page with a message
                return Redirect("../Routes/ViewRoutes?action=delete_route");
            }
            else
            {
                return Redirect("../Routes/ViewRoutes?action=unauthorized");
            }

        }

        /*
         * Deletes selected waypoint and reorders the route waypoints.
         * Users can only delete waypoints associated with routes they created/own.
         * */
        public ActionResult DeleteWaypoint()
        {
            var context = new WaypointsContext();
            var rtContext = new RoutesContext();
            int wpid = int.Parse(Request.Params.Get(0));
            int route = int.Parse(Request.Params.Get(1));
            Waypoints wp = context.Waypoints.Find(wpid);
            Routes rt = rtContext.Routes.Find(wp.RouteId);
            //Check if user is authorized to view/edit/delete
            if (WebSecurity.CurrentUserId == rt.UserId)
            {
                int wpOrderDeleted = wp.Order;
                int wpRouteId = wp.RouteId;
                context.Waypoints.Remove(wp);
                context.SaveChanges();                
                //Reorder the waypoints in this route now that one is deleted
                var waypointsInRoute = from m in context.Waypoints where m.RouteId == wpRouteId orderby m.Order select m;
                foreach (Waypoints wpr in waypointsInRoute)
                {
                    if (wpr.Order > wpOrderDeleted)
                    {
                        wpr.Order = wpr.Order - 1;
                    }
                }
                context.SaveChanges();
                //Redirect to details page with message
                return Redirect("../Routes/RouteDetails?route=" + route.ToString() + "&action=delete_waypoint");
            }
            else
            {
                return Redirect("../Routes/RouteDetails?route=" + route.ToString() + "&action=unauthorized");
            }
        }

        /**
         * Displays a list of all routes created by the user
         * */
        public ActionResult ViewRoutes()
        {
            var context = new RoutesContext();
            //Get routes from database
            var routes = from m in context.Routes where m.UserId == WebSecurity.CurrentUserId select m;
            return View(routes);
        }

        /*
         * Displays all waypoints associated with a route
         * */
        public ActionResult RouteDetails()
        {
            var rContext = new RoutesContext();
            var wpContext = new WaypointsContext();
            string rid = Request.Params.Get(0);
            int routeId = int.Parse(rid);
            Routes route = rContext.Routes.Find(routeId);
            //Verify user is authorized
            if (WebSecurity.CurrentUserId == route.UserId)
            {
                ViewBag.RouteName = route.Name;
                //Select waypoints from database
                var waypoints = from m in wpContext.Waypoints where m.RouteId == routeId orderby m.Order ascending select m;
                return View(waypoints);
            }
            else
            {
                return View();
            }
        }
    
        /**
         * Saves the Waypoints submitted via the web form.
         * Waypoints are submitted as a JSON string and saved in the database. 
         * */
        [HttpPost]       
        public ActionResult SaveWaypoints(string waypoints, string routeName, string addresses)
        {            
            UsersContext db = new UsersContext();           
            try
            {
                //Here we get the JSON string (String waypoints), convert it to C# objects and save to the database.
                JavaScriptSerializer js = new JavaScriptSerializer();
                List<WayPointSet> waypointList = js.Deserialize<List<WayPointSet>>(waypoints);
                AddressSet[] addressList = js.Deserialize<AddressSet[]>(addresses);
                int order = 1;
                using (var rc = new RoutesContext())
                {      
                    string parsedRouteName;
                    //Check to see that we have a route name. If not, we create one.
                    if (routeName.Length > 0)
                    {
                        parsedRouteName = routeName;
                    }
                    else
                    {
                        parsedRouteName = "Route created on " + DateTime.Now.ToShortDateString();
                    }

                    var route = new Routes { UserId = WebSecurity.CurrentUserId, Name = parsedRouteName };
                    rc.Routes.Add(route);
                    rc.SaveChanges();         
                    //The below is deprecated, but left in just in case we want to change the way we use the API in the future
                    //string routeString = "origin=" + waypointList[0].jb + "," + waypointList[0].kb + "&destination=" + waypointList.Last<WayPointSet>().jb + "," + waypointList.Last<WayPointSet>().kb + "&waypoint=optimize:true";
                    using (var wc = new WaypointsContext())
                    {
                        foreach (WayPointSet wps in waypointList)
                        {
                            //The below is deprecated, but left in just in case we want to change the way we use the API in the future
                            //if (!waypointList.IndexOf(wps).Equals(0) || !waypointList.Last<WayPointSet>().Equals(wps))
                            //{
                                //routeString += "|" + wps.jb + "," + wps.kb;
                            //}
                            var wp = new Waypoints { Lat = wps.jb, Lng = wps.kb, Order = order, RouteId = route.ID, Address = addressList[waypointList.IndexOf(wps)].address };
                            wc.Waypoints.Add(wp);
                            order++;                           
                        }
                        wc.SaveChanges();
                        //The below is deprecated, but left in just in case we want to change the way we use the API in the future
                        //routeString += "&sensor=true";
                        //route.RouteString = routeString;
                        rc.SaveChanges();
                    }
                }                                              
            }
            catch (Exception e)
            {
                return View(e.ToString());
                //The below is deprecated, but left in just in case we want to change the way we use the API in the future
                //return Json("[{result:false}]");               
            }
            return Json("[{result:true}]");
        }


    }

    /**
     * Objects to store Waypoint information 
     * This helps serialize the objects from JSON to C# objects
     * */
    [Serializable]
    public class WayPointSet
    {
        public string jb { get; set; }
        public string kb { get; set; }
    }

    [Serializable]
    public class AddressSet
    {
        public string address { get; set; }
    }

}
