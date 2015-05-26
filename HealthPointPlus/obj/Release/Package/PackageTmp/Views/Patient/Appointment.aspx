<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HealthPointPlus.Models.Appointment>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Appointment
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300">Create Appointment</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Appointment Data<% if (ViewBag.Return != null){ %> for Patient <%: ViewBag.Patients[0].LastName %>, <%: ViewBag.Patients[0].FirstName %><% } %></legend>
    <div class="row-fluid">
        <div class="span4">
            Appointment Date<br />
            <%: Html.EditorFor(model => model.Date) %><br />
            <%: Html.ValidationMessageFor(model => model.Date) %>
        </div>

        <div class="span4">
            Patient<br />
            <% List<HealthPointPlus.Models.Patient> pts = ViewBag.Patients; %>            
            <% if (pts != null){ %>
                   <select id="PatientId" name="PatientId">
                <%   foreach (var item in pts){ %>
               <option value="<%: item.ID %>"><%: item.LastName %>, <%: item.FirstName %> <%: item.MiddleInitial %></option>
                <% } %>
            </select><br />
            <%: Html.ValidationMessageFor(model => model.PatientId) %>
            <% } %>                            
        </div>

        <div class="span4">
            Duration<br />
            <select id="Duration" name="Duration">
                <option value="15">15 Minutes</option>
                <option value="30">30 Minutes</option>
                <option value="60">60 Minutes</option>
                <option value="90">1.5 Hours</option>
                <option value="120">2 Hours</option>
                <option value="180">2.5 Hours</option>
                <option value="210">3 Hours</option>
            </select><br />
            <%: Html.ValidationMessageFor(model => model.Duration) %>
        </div>
    </div>
    <div class="row-fluid">

        <div class="span4">
            Assessment<br />
            <%: Html.EditorFor(model => model.Assessment) %><br />
            <%: Html.ValidationMessageFor(model => model.Assessment) %>
        </div>

        <div class="span4">
            Diagnosis Codes<br />
            <%: Html.EditorFor(model => model.DiagnosisCode) %><br />
            <%: Html.ValidationMessageFor(model => model.DiagnosisCode) %>
        </div>

        <div class="span4">
            Labs Requested<br />
            <%: Html.EditorFor(model => model.LabsRequested) %><br />
            <%: Html.ValidationMessageFor(model => model.LabsRequested) %>
        </div>
</div>
    <div class="row-fluid">
        <div class="span4">
            Treatment Plan<br />
            <%: Html.EditorFor(model => model.TreatmentPlan) %><br />
            <%: Html.ValidationMessageFor(model => model.TreatmentPlan) %>
        </div>

        <div class="span4">
            Patient Notes <br />
            <%: Html.EditorFor(model => model.PatientNotes) %><br />
            <%: Html.ValidationMessageFor(model => model.PatientNotes) %>
        </div>

        <div class="span4">
            Next Follow-up Date<br />
            <%: Html.EditorFor(model => model.NextFollowup) %><br />
            <%: Html.ValidationMessageFor(model => model.NextFollowup) %>
        </div>
</div>
<div class="row-fluid">        
        <div class="span12" style="margin-top: 20px;">
            <input type="submit" value="Create Appointment" class="btn btn-primary btn-large" />&nbsp;&nbsp;<% if (ViewBag.Return != null){ %><%: Html.ActionLink("Cancel", "Details", new { ID = ViewBag.Return }, new { @class = "btn btn-large" })%><% }else{ %><%: Html.ActionLink("Cancel", "Forms", null, new { @class = "btn btn-large" })%><% } %>
        </div>
</div>
    </fieldset>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LogoutHolder" runat="server">
          <% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script>
        $(document).ready(function () {
            $("#Date").val(null);
            $("#NextFollowup").val(null);
            $("#Date").datepicker({
                changeMonth: true,
                changeYear: true,
                dateformat: 'mm/dd/yyyy',
                defaultDate: new Date(),
                yearRange: '<%: DateTime.Now.Year %>:<%: DateTime.Now.AddYears(1).Year %>'
            });
            $("#NextFollowup").datepicker({
                changeMonth: true,
                changeYear: true,
                dateformat: 'mm/dd/yyyy',
                defaultDate: new Date(),
                yearRange: '<%: DateTime.Now.Year %>:<%: DateTime.Now.AddYears(5).Year %>'
            });
        });
    </script>
 
</asp:Content>
