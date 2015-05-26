<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Forms
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Available Forms</h2>
<div class="row-fluid">
    <div class="span12">
    <table class="table table-bordered table-striped" style="width: 100%;">
    <thead>
        <th>Form Name</th>
        <th>Description</th>
        <th  style="text-align: center">Actions</th>
    </thead>
    <tbody>
      <tr>
        <td>
            Appointment Tracking
        </td>
        <td>
            Use this form to plan and track patient appointments and other encounters.
        </td>
        <td  style="text-align: center">
        <%: Html.ActionLink("Select", "Appointment", null, new { @class = "btn btn-primary"}) %>
        </td>        
    </tr>
    <tr>
        <td>
            Vitals Collection
        </td>
        <td>
            Use this form to collect patient vitals and track over a period of time.
        </td>
        <td  style="text-align: center">
    <%: Html.ActionLink("Select", "Vitals", null, new { @class = "btn btn-primary"}) %>
        </td>
    </tr>
    </tbody>
    </table>
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
