<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Overdue Appointment Report
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Overdue Appointment Report</h2>
    <br />
    <div class="row-fluid">
    <div class="span3">
        <%: Html.ActionLink("Return to Reports", "Reports", "Home", null, new { @class = "btn btn-primary btn-large"}) %>
    </div>    
    <div class="span9">
<h4 style="font-weight: 300; margin-top: 0px;">Patient Overdue Appointment List</h4>
<table class="table table-bordered table-striped" style="width: 100%">
    <thead>
        <th>
            Patient Name
        </th>
        <th>
            Phone
        </th>
        <th>
           Follow-up Due
        </th>        
        <th style="text-align: center">Actions</th>
    </thead>
    <tbody>
<% foreach (var item in ViewBag.Appointments) { %>
        <% HealthPointPlus.Models.Patient patient = ViewBag.Patients[item.PatientId]; %>
    <tr>
        <td>
           <%: patient.LastName  %>, <%: patient.FirstName %> <%: patient.MiddleInitial %>
        </td>
        <td>
            <%: patient.Phone %>
        </td>
        <td>
           <%: item.NextFollowup.Month %>/<%: item.NextFollowup.Day %>/<%: item.NextFollowup.Year %>
        </td>
        <td style="text-align: center">
            <%: Html.ActionLink("View Details", "Details", "Patient", new { id=patient.ID }, new { @class = "btn btn-primary btn-small"}) %>
        </td>
    </tr>
<% } %>
    </tbody>
</table>
    </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LogoutHolder" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
