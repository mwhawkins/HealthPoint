/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version: July 26, 2013
 * Patient Controller unit tests.
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
    public class PatientControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Arrange
            PatientController controller = new PatientController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Forms()
        {
            // Arrange
            PatientController controller = new PatientController();

            // Act
            ViewResult result = controller.Forms() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Vitals()
        {
            // Arrange
            PatientController controller = new PatientController();

            // Act
            ViewResult result = controller.Vitals() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void VitalsDetails()
        {
            // Arrange
            PatientController controller = new PatientController();

            // Act
            ViewResult result = controller.VitalsDetails(1) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Reports()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Reports() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Create()
        {
            // Arrange
            PatientController controller = new PatientController();

            // Act
            ViewResult result = controller.Create() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Details()
        {
            // Arrange
            PatientController controller = new PatientController();

            // Act
            ViewResult result = controller.Details(1) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Edit()
        {
            // Arrange
            PatientController controller = new PatientController();

            // Act
            ViewResult result = controller.Edit(1) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Appointment()
        {
            // Arrange
            PatientController controller = new PatientController();

            // Act
            ViewResult result = controller.Appointment() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void AppointmentDetails()
        {
            // Arrange
            PatientController controller = new PatientController();

            // Act
            ViewResult result = controller.AppointmentDetails(8) as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }


    }
}
