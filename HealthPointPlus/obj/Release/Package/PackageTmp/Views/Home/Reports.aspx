<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reports | HealthPoint Plus
</asp:Content>

<asp:Content ID="ReportsLogout" ContentPlaceHolderID="LogoutHolder" runat="server">
<% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Reports</h2>
    <br />
    <div class="row-fluid">
        <div class="span12">
            <h4 style="font-weight: 300; margin-top: 0px;">Reports Available</h4>
            <table class="table table-bordered table-striped" width="100%" style="width: 100%">
                <thead>
                    <th>Report Name</th>
                    <th>Description</th>
                    <th style="text-align: center">Actions</th>
                </thead>
                <tbody>
                    <tr>
                        <td>Overdue Appointments</td>
                        <td>Provides a table listing all patients with overdue follow-up appointments.</td>
                        <td style="text-align: center"><%: Html.ActionLink("View Report", "OverdueAppointmentReport", "Reports", null, new { @class = "btn btn-primary btn-small" }) %></td>
                    </tr>
                    <tr>
                        <td>Routes and Waypoints Report</td>
                        <td>Provides general information about the routes and waypoints you created.</td>
                        <td style="text-align: center"><%: Html.ActionLink("View Report", "RoutesReport", "Reports", null, new { @class = "btn btn-primary btn-small" }) %></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
