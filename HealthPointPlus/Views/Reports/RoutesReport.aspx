<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Routes Report
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Routes and Waypoints Report</h2>
    <p>
        <%: Html.ActionLink("Return to Reports", "Reports", "Home", null, new { @class = "btn btn-primary btn-large"}) %>
    </p><br />
    <div class="row-fluid">         
        <div class="span4 well" style="text-align:center">
            You have created<br />
            <h2><%: ViewBag.Routes.Count %></h2>
            routes in the application to date.
        </div>
        <div class="span4 well" style="text-align: center">
            Of those routes, there are<br />
            <h2><%: ViewBag.WaypointCount %></h2>
            waypoints associated with them.
        </div>
        <div class="span4 well" style="text-align:center">
            In total, your routes have<br />
            <h2><%: ViewBag.TotalDistance.ToString("F2") %></h2>
            miles of travel in them.
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <h4>Routes and Distances</h4>
            <table class="table table-bordered table-striped" style="width: 100%" width="100%">
                <thead>
                    <th>Route Name</th>
                    <th style="text-align:center">Distance</th>
                    <th style="text-align: center">Actions</th>
                </thead>
                <tbody>
                    <% foreach (KeyValuePair<HealthPointPlus.Models.Routes, double> kvp in ViewBag.RouteDistances){ %>
                    <tr>
                        <td><%: kvp.Key.Name %></td>
                        <td style="text-align:center"><%: kvp.Value.ToString("F2") %> miles</td>
                        <td style="text-align: center"><a href="../Routes/RouteDetails?id=<%: kvp.Key.ID %>" class="btn btn-small btn-primary">View Route Details</a></td>
                    </tr>
                    <% 
                       } %>
                </tbody>
            </table>
            Total Distance Travelled: <%: ViewBag.TotalDistance.ToString("F2") %> Miles
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LogoutHolder" runat="server">
    <% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
