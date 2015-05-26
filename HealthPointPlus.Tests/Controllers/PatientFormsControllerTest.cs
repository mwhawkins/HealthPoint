/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version: July 26, 2013
 * Patient Forms Controller unit tests.
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
    public class PatientFormsControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Arrange
            PatientFormsController controller = new PatientFormsController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }       

    }
}
