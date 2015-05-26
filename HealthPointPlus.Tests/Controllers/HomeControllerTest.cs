/**
 * CMSC 495 Final Project
 * Team HealthPoint
 * 
 * ASP.NET MVC 4, .NET version 4.0/4.5
 * 
 * Final Version: July 26, 2013
 * Home Controller unit tests.
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
    public class HomeControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void About()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.About() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Navigation()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Navigation() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void PatientData()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.PatientData() as ViewResult;

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
        public void Help()
        {
            // Arrange
            HomeController controller = new HomeController();

            // Act
            ViewResult result = controller.Help() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

    }
}
