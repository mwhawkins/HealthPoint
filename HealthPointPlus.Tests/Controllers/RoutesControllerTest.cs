/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version: July 26, 2013
 * Routes Controller unit tests.
 * These are simple tests to verify the pages
 * load as planned.
 * */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using HealthPointPlus;
using HealthPointPlus.Controllers;

namespace HealthPointPlus.Tests.Controllers
{
    [TestClass]
    public class RoutesControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Arrange
            RoutesController controller = new RoutesController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void AddWaypoints()
        {
            // Arrange
            RoutesController controller = new RoutesController();

            // Act
            ViewResult result = controller.AddWaypoints() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void ViewRoutes()
        {
            // Arrange
            RoutesController controller = new RoutesController();

            // Act
            ViewResult result = controller.ViewRoutes() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
       

    }
}
