<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HealthPointPlus.Models.Appointment>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Appointment Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Appointment Details</h2>
    <% HealthPointPlus.Models.Patient patient = ViewBag.Patient; %>
     <% if (ViewBag.ActionName == "appointment_added"){ %>
    <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Success!</h4>
            The appointment has been added to the database and the details are below.
     </div>
    <% } %>
<fieldset>
    <legend>Appointment for <%: patient.LastName %>, <%:  patient.FirstName %> <%: patient.MiddleInitial%></legend>
<div class="row-fluid">
    <div class="span4">
        <b>Appointment Date:</b><br />
        <%: Html.DisplayFor(model => model.Date) %>
    </div>

    <div class="span4">
        <b>Appointment Duration:</b><br />
        <%: Html.DisplayFor(model => model.Duration) %>
    </div>

    <div class="span4">
        <b>Assessment:</b><br />
        <%: Html.DisplayFor(model => model.Assessment) %>
    </div>
</div>
<div class="row-fluid">
    <div class="span4">
       <b>Diagnosis Code(s):</b><br />
        <%: Html.DisplayFor(model => model.DiagnosisCode) %>
    </div>

    <div class="span4">
        <b>Labs Requested:</b><br />
        <%: Html.DisplayFor(model => model.LabsRequested) %>
    </div>

    <div class="span4">
        <b>Treatment Plan:</b><br />
        <%: Html.DisplayFor(model => model.TreatmentPlan) %>
    </div>
</div>
<div class="row-fluid">
    <div class="span4">
       <b>Patient Notes:</b><br />
        <%: Html.DisplayFor(model => model.PatientNotes) %>
    </div>

    <div class="span4">
        <b>Next Follow-up Visit:</b><br />
        <%: Html.DisplayFor(model => model.NextFollowup) %>
    </div>
    <div class="span4">
        &nbsp;
    </div>
</div>
</fieldset>
<div class="row-fluid" style="margin-top: 30px;">
<div class="span12">
    <%: Html.ActionLink("Return to Patient Details", "Details", new { ID = Model.PatientId }, new { @class = "btn btn-large" })%>&nbsp;&nbsp;
    <a href="#" onclick="deleteConfirm(<%: Model.ID %>, <%: patient.ID %>)" class="btn btn-danger btn-large">Delete</a>
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
    </script>
</asp:Content>
