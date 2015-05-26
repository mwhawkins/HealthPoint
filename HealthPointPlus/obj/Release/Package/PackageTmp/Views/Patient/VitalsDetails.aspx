<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HealthPointPlus.Models.Vitals>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Vitals Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Patient Vitals Details</h2>

<fieldset>
    <legend>Vitals for patient <%: ViewBag.Patient.LastName %>, <%: ViewBag.Patient.FirstName %> <%: ViewBag.Patient.MiddleInitial %> taken on <%: Model.Date.Month %>/<%: Model.Date.Day %>/<%: Model.Date.Year %></legend>
<div class="row-fluid">
    <div class="span4">
        <b>Patient Name:</b><br />
        <%: ViewBag.Patient.LastName %>, <%: ViewBag.Patient.FirstName %> <%: ViewBag.Patient.MiddleInitial %>
    </div>

    <div class="span4">
        <b>Pulse:</b><br />
        <%: Html.DisplayFor(model => model.Pulse) %> beats per minute
    </div>

    <div class="span4">
        <b>Respiratory Rate:</b><br />
        <%: Html.DisplayFor(model => model.RespiratoryRate) %> breaths per minute
    </div>
</div>
<div class="row-fluid">
    <div class="span4">
        <b>Body Temperature:</b><br />
        <%: Html.DisplayFor(model => model.BodyTemperature) %> degrees Fahrenheit
    </div>

    <div class="span4">
       <b>Blood Pressure:</b><br />
        <%: Html.DisplayFor(model => model.BloodPressure) %>
    </div>

    <div class="span4">
        <b>Date Taken:</b><br />
        <%: Model.Date.Month %>/<%: Model.Date.Day %>/<%: Model.Date.Year %>
    </div>
</fieldset>
<div class="row-fluid">
    <div class="span12" style="margin-top: 30px">
    <%: Html.ActionLink("Return to Patient Details", "Details", "Patient", new { ID = ViewBag.Patient.ID }, new { @class = "btn btn-large" })%>
    </div>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
    <style>
        .row-fluid {
            margin-top: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LogoutHolder" runat="server">
          <% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
