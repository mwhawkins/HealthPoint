<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home | HealthPoint Plus
</asp:Content>

<asp:Content ID="IndexLogout" ContentPlaceHolderID="LogoutHolder" runat="server">
<% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
     <!-- Jumbotron -->
    <% if (Request.Params.Get(0) == "True"){ %>
    <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Success!</h4>
            You have been completely logged out of the system. Come back soon!
     </div>
    <% } %>
      <div class="jumbotron">
        <h2>Welcome to HealthPoint Plus <i class="icon-plus-sign"></i></h2>
        <p class="lead">HealthPoint Plus is a geographic routing and data collection tool for mobile care providers.</p>       
    <% if (!User.Identity.IsAuthenticated){ %>
        <a class="btn btn-primary" href="../Account/Login">Sign In</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-inverse" href="../Account/Register">Register</a>
    <% } %>
      </div>      
    <% if (User.Identity.IsAuthenticated){ %>
    <hr>  
      <div class="row-fluid">
        <div class="span4">
          <h2>News</h2>
          <p>Welcome to HealthPoint Plus version 0.5 Beta! (Codename Week 8).
              We're working hard to add features all the time and,
              when we do, you'll see the announcement details 
              right here.
          </p>
        </div>
        <div class="span4">
          <h2>Stats</h2>
          <p>Coming Soon...</p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
       </div>
        <div class="span4">
          <h2>Team</h2>
          <p>Coming Soon...</p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
        </div>
      </div>
    <% } %>
</asp:Content>
