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
    public class ReportsControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Arrange
            ReportsController controller = new ReportsController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void OverdueAppointmentReport()
        {
            // Arrange
            ReportsController controller = new ReportsController();

            // Act
            ViewResult result = controller.OverdueAppointmentReport() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void RoutesReport()
        {
            // Arrange
            ReportsController controller = new ReportsController();

            // Act
            ViewResult result = controller.RoutesReport() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }
       

    }
}
