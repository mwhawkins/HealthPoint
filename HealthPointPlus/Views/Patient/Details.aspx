<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HealthPointPlus.Models.Patient>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Patient Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300">Patient Details</h2>
     <% if (ViewBag.ActionName == "appointment_deleted"){ %>
    <div class="alert alert-info">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Appointment Deleted</h4>
            The selected appointment was deleted from the database.
     </div>
    <% }else if (ViewBag.ActionName == "vitals_deleted"){ %>
        <div class="alert alert-info">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Vitals Deleted</h4>
            The selected vitals record was deleted from the database.
     </div>
    <% }else if (ViewBag.ActionName == "vitals_added"){ %>
        <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Success!</h4>
            The vitals record has been added to the database for the patient below.
     </div>
    <% } %>
<fieldset>
    <legend>Details for Patient <%: ViewBag.Name %></legend>
<div class="row-fluid">
    <div class="span4">
        <b>First Name:</b><br />
        <%: Html.DisplayFor(model => model.FirstName) %>
    </div>

    <div class="span4">
        <b>Middle Initial:</b><br />
        <%: Html.DisplayFor(model => model.MiddleInitial) %>
    </div>

    <div class="span4">
        <b>Last Name:</b><br />
        <%: Html.DisplayFor(model => model.LastName) %>
    </div>
</div>
<div class="row-fluid">
    <div class="span4">
        <b>Date of Birth:</b><br />
        <%: Model.DOB.Month %>/<%: Model.DOB.Day %>/<%: Model.DOB.Year %>
    </div>

    <div class="span4">
        <b>Address:</b><br />
        <%: Html.DisplayFor(model => model.Address) %>
    </div>

    <div class="span4">
        <b>Phone Number:</b><br />
        <%: Html.DisplayFor(model => model.Phone) %>
    </div>
</div>
<div class="row-fluid">
    <div class="span4">
        <b>Allergies:</b><br />
        <%: Html.DisplayFor(model => model.Allergies) %>
    </div>

    <div class="span4">
        <b>Height:</b><br />
        <%: Html.DisplayFor(model => model.Height) %>
    </div>

    <div class="span4">
        <b>Weight:</b><br />
        <%: Html.DisplayFor(model => model.Weight) %>
    </div>
</div>
    <div class="row-fluid">
    <div class="span4">
        <b>Medical History:</b><br />
        <%: Html.DisplayFor(model => model.MedicalHistory) %>
    </div>

    <div class="span4">
        <b>Emergency Contact Phone:</b><br />
        <%: Html.DisplayFor(model => model.EmergencyContact) %>
    </div>

    <div class="span4">
        <b>Current Medications:</b><br />
        <%: Html.DisplayFor(model => model.CurrentMedications) %>
    </div>
</div>
</fieldset>
    <div class="row-fluid" style="margin-top: 30px;">
    <div class="span12">
    <%: Html.ActionLink("Edit Patient", "Edit", new { id = Model.ID }, new { @class = "btn btn-primary btn-large" })%> &nbsp;&nbsp;
    <%: Html.ActionLink("Return to List", "Index", null, new { @class = "btn btn-large" })%>
    </div>
</div>
<div class="row-fluid" style="margin-top:30px;"> 
    <legend>Appointment History for Patient <%: ViewBag.Name %></legend>
<div class="row-fluid" style="margin-top: 20px;">
    <div class="span12">
    <%: Html.ActionLink("Create Appointment", "Appointment", new { ID = Model.ID }, new { @class = "btn btn-large btn-primary" })%>
    </div>
</div>
<div class="row-fluid" style="margin-top: 20px;">
    <div class="span12">
        <table class="table table-bordered table-striped" style="width:100%">
            <thead>
                <th>Appointment Date</th>
                <th>Follow-up By</th>
                <th style="text-align: center;">Actions</th>
            </thead>
            <tbody>
            <% if (ViewBag.Appointments.Count > 0){ %>
                <% foreach (var apt in ViewBag.Appointments) { %>
                <tr>
                    <td>
                        <%: apt.Date.Month %>/<%: apt.Date.Day %>/<%: apt.Date.Year %>
                    </td>
                    <td>
                        <%: apt.NextFollowup.Month %>/<%: apt.NextFollowup.Day %>/<%: apt.NextFollowup.Year %>
                    </td>
                    <td style="text-align: center;">
                        <%: Html.ActionLink("Details", "AppointmentDetails", new { ID = apt.ID }, new { @class = "btn btn-small btn-primary" })%>&nbsp;&nbsp;
                        <a href="#" onclick="deleteConfirm(<%: apt.ID %>, <%: Model.ID %>)" class="btn btn-danger btn-small">Delete</a>
                    </td>                
                </tr>
                <% } %>
            <% }else{ %>
                <tr>
                    <td colspan="3">No appointments found for this patient.</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>  
</div>
</div>
    <div class="row-fluid" style="margin-top:10px;"> 
    <legend>Vitals History for Patient <%: ViewBag.Name %></legend>
<div class="row-fluid" style="margin-top: 20px;">
    <div class="span12">
    <%: Html.ActionLink("Collect Vitals", "Vitals", new { PatientId = Model.ID }, new { @class = "btn btn-large btn-primary" })%>
    </div>
</div>
<div class="row-fluid" style="margin-top: 20px;">
    <div class="span12">
        <table class="table table-bordered table-striped" style="width:100%">
            <thead>
                <th>Date Taken</th>
                <th>Blood Pressure</th>
                <th>Pulse</th>
                <th>Respiratory Rate</th>
                <th>Body Temp</th>
                <th style="text-align: center;">Actions</th>
            </thead>
            <tbody>
            <% if (ViewBag.Vitals.Count > 0){ %>
                <% foreach (var vital in ViewBag.Vitals) { %>
                <tr>
                    <td>
                        <%: vital.Date.Month %>/<%: vital.Date.Day %>/<%: vital.Date.Year %>
                    </td>
                    <td>
                        <%: vital.BloodPressure %>
                    </td>
                    <td>
                        <%: vital.Pulse %>
                    </td>
                    <td>
                        <%: vital.RespiratoryRate %>
                    </td>
                    <td>
                        <%: vital.BodyTemperature %>
                    </td>
                    <td style="text-align: center;">
                        <%: Html.ActionLink("Details", "VitalsDetails", new { ID = vital.ID }, new { @class = "btn btn-small btn-primary" })%>&nbsp;&nbsp;
                        <a href="#" onclick="deleteVitalsConfirm(<%: vital.ID %>, <%: Model.ID %>)" class="btn btn-danger btn-small">Delete</a>
                    </td>                
                </tr>
                <% } %>
            <% }else{ %>
                <tr>
                    <td colspan="6">No vitals history found for this patient.</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>  
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
        <script>
            function deleteConfirm(itemId, patientId) {
                var r = confirm("Are you sure you want to permanently delete this appointment record?");
                if (r == true) {
                    window.location.href = "../DeleteAppointment/" + itemId + "?PatientId=" + patientId;
                }
            }
            function deleteVitalsConfirm(itemId, patientId) {
                var r = confirm("Are you sure you want to permanently delete this vitals record?");
                if (r == true) {
                    window.location.href = "../DeleteVitals/" + itemId + "?PatientId=" + patientId;
                }
            }
    </script>
</asp:Content>
