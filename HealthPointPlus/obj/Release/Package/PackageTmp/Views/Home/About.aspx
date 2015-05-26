<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About | HealthPoint Plus
</asp:Content>

<asp:Content ID="AboutLogout" ContentPlaceHolderID="LogoutHolder" runat="server">
<% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">

        <h2 style="font-weight: 300;">About Team HealthPoint</h2><br />
        <p>We're a scrappy team of computer and information science professionals putting together a final project.
         <br /><br />
         The team consists of:
            <ul>
                <li>Dale Reves</li>
                <li>Mike Hawkins</li>
                <li>Fred McNeil</li>
                <li>De Harris</li>
                <li>Ian Staley</li>
            </ul>
        </p>
</asp:Content>