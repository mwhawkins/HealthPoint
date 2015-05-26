<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HealthPointPlus.Models.Patient>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Edit Patient</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend><%: ViewBag.Name %></legend>

        <%: Html.HiddenFor(model => model.ID) %>
<div class="row-fluid">
        <div class="span4">
            <b>First Name:</b><br />
            <%: Html.EditorFor(model => model.FirstName) %><br />
            <%: Html.ValidationMessageFor(model => model.FirstName) %>
        </div>

        <div class="span4">
            <b>Middle Initial:</b><br />
            <%: Html.EditorFor(model => model.MiddleInitial) %><br />
            <%: Html.ValidationMessageFor(model => model.MiddleInitial) %>
        </div>

        <div class="span4">
            <b>Last Name:</b><br />
            <%: Html.EditorFor(model => model.LastName) %><br />
            <%: Html.ValidationMessageFor(model => model.LastName) %>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <b>Date of Birth:</b><br />
            <%: Html.EditorFor(model => model.DOB) %><br />
            <%: Html.ValidationMessageFor(model => model.DOB) %>
        </div>

        <div class="span4">
            <b>Address:</b><br />
            <%: Html.EditorFor(model => model.Address) %><br />
            <%: Html.ValidationMessageFor(model => model.Address) %>
        </div>

        <div class="span4">
           <b>Phone Number:</b><br />
            <%: Html.EditorFor(model => model.Phone) %><br />
            <%: Html.ValidationMessageFor(model => model.Phone) %>
        </div>
    </div>
<div class="row-fluid">
        <div class="span4">
            <b>Allergies:</b><br />
            <%: Html.EditorFor(model => model.Allergies) %><br />
            <%: Html.ValidationMessageFor(model => model.Allergies) %>
        </div>

        <div class="span4">
           <b>Height:</b><br />
            <%: Html.EditorFor(model => model.Height) %><br />
            <%: Html.ValidationMessageFor(model => model.Height) %>
        </div>

        <div class="span4">
            <b>Weight:</b><br />
            <%: Html.EditorFor(model => model.Weight) %>
            <%: Html.ValidationMessageFor(model => model.Weight) %>
        </div>
</div>
<div class="row-fluid">
        <div class="span4">
           <b>Medical History:</b><br />
            <%: Html.EditorFor(model => model.MedicalHistory) %><br />
            <%: Html.ValidationMessageFor(model => model.MedicalHistory) %>
        </div>

        <div class="span4">
            <b>Emergency Contact Phone:</b><br />
            <%: Html.EditorFor(model => model.EmergencyContact) %><br />
            <%: Html.ValidationMessageFor(model => model.EmergencyContact) %>
        </div>

        <div class="span4">
            <b>Current Medications:</b><br />
            <%: Html.EditorFor(model => model.CurrentMedications) %><br />
            <%: Html.ValidationMessageFor(model => model.CurrentMedications) %>
        </div>
</div>
<div class="row-fluid" style="margin-top: 30px;">
        <div class="span12">
            <input type="submit" value="Save" class="btn btn-primary btn-large" />&nbsp;&nbsp;<%: Html.ActionLink("Cancel", "Details", new { ID = Model.ID }, new { @class = "btn btn-large" })%>
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
   
</asp:Content>
