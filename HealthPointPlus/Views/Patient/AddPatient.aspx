<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HealthPointPlus.Models.Patient>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AddPatient
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>AddPatient</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Add New Patient</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.FirstName) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.FirstName) %>
            <%: Html.ValidationMessageFor(model => model.FirstName) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.MiddleInitial) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.MiddleInitial) %>
            <%: Html.ValidationMessageFor(model => model.MiddleInitial) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.LastName) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.LastName) %>
            <%: Html.ValidationMessageFor(model => model.LastName) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DOB) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DOB) %>
            <%: Html.ValidationMessageFor(model => model.DOB) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Address) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Address) %>
            <%: Html.ValidationMessageFor(model => model.Address) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Phone) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Phone) %>
            <%: Html.ValidationMessageFor(model => model.Phone) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Allergies) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Allergies) %>
            <%: Html.ValidationMessageFor(model => model.Allergies) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Height) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Height) %>
            <%: Html.ValidationMessageFor(model => model.Height) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Weight) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Weight) %>
            <%: Html.ValidationMessageFor(model => model.Weight) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.MedicalHistory) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.MedicalHistory) %>
            <%: Html.ValidationMessageFor(model => model.MedicalHistory) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EmergencyContact) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EmergencyContact) %>
            <%: Html.ValidationMessageFor(model => model.EmergencyContact) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CurrentMedications) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CurrentMedications) %>
            <%: Html.ValidationMessageFor(model => model.CurrentMedications) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
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
