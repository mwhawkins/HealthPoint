<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HealthPointPlus.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register | HealthPoint Plus
</asp:Content>

<asp:Content ID="headContentRegister" ContentPlaceHolderID="HeadCSS" runat="server">
    <style type="text/css">
      body {
        background-color: #fff;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fafafa;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <form class="form-signin" action="../Account/Register" method="POST">
        <h2 class="form-signin-heading">Register New User</h2>
    <% using (Html.BeginForm()) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary() %>

                    <%: Html.LabelFor(m => m.UserName) %>
                    <%: Html.TextBoxFor(m => m.UserName) %>

                    <%: Html.LabelFor(m => m.Password) %>
                    <%: Html.PasswordFor(m => m.Password) %>

                    <%: Html.LabelFor(m => m.ConfirmPassword) %>
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>

            <input type="submit" class="btn btn-large btn-primary" value="Register" />
    <% } %>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">

</asp:Content>
