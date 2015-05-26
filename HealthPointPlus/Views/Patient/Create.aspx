<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HealthPointPlus.Models.Patient>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create Patient
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Create Patient</h2>
      <% if (Request.Params.Get(0) == "patient_error"){ %>
    <div class="alert alert-error">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Oops!</h4>
            Something was wrong there and we weren't able to save the patient.  Did you fill in all the required fields?  If not, try again.
     </div>
    <% } %>
<% using (Html.BeginForm("Create","Patient")) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Patient Information</legend>
        * denotes required fields<br /><br />
        <div class="row-fluid">
        <div class="span4">
            *First Name<br />        
            <%: Html.EditorFor(model => model.FirstName) %><br />
            <%: Html.ValidationMessageFor(model => model.FirstName)%>
        </div>
        <div class="span4">
            Middle Initial<br />
            <%: Html.EditorFor(model => model.MiddleInitial) %><br />
            <%: Html.ValidationMessageFor(model => model.MiddleInitial) %>
        </div>
        <div class="span4">
            *Last Name<br />
            <%: Html.EditorFor(model => model.LastName) %><br />
            <%: Html.ValidationMessageFor(model => model.LastName) %>
        </div>
    </div>
         <div class="row-fluid">
        <div class="span4">
            *Date of Birth (DOB)<br />
            <%: Html.EditorFor(model => model.DOB) %><br />
            <%: Html.ValidationMessageFor(model => model.DOB) %>
        </div>

        <div class="span4">
            *Address<br />
            <%: Html.EditorFor(model => model.Address) %><br />
            <%: Html.ValidationMessageFor(model => model.Address) %>
        </div>

        <div class="span4">
            *Phone Number<br />       
            <%: Html.EditorFor(model => model.Phone) %><br />
            <%: Html.ValidationMessageFor(model => model.Phone) %>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            Allergies<br />
            <%: Html.EditorFor(model => model.Allergies) %><br />
            <%: Html.ValidationMessageFor(model => model.Allergies) %>
        </div>

        <div class="span4">
            Height<br />
            <%: Html.EditorFor(model => model.Height) %><br />
            <%: Html.ValidationMessageFor(model => model.Height) %>
        </div>

        <div class="span4">
            Weight<br />
            <%: Html.EditorFor(model => model.Weight) %><br />
            <%: Html.ValidationMessageFor(model => model.Weight) %>
        </div>
    </div>
 <div class="row-fluid">
        <div class="span4">
           Medical History<br />
            <%: Html.EditorFor(model => model.MedicalHistory) %><br />
            <%: Html.ValidationMessageFor(model => model.MedicalHistory) %>
        </div>

        <div class="span4">
            Emergency Contact Phone Number<br />
            <%: Html.EditorFor(model => model.EmergencyContact) %><br />
            <%: Html.ValidationMessageFor(model => model.EmergencyContact) %>
        </div>

        <div class="span4">
            Current Medications
            <%: Html.EditorFor(model => model.CurrentMedications) %><br />
            <%: Html.ValidationMessageFor(model => model.CurrentMedications) %>
        </div>
</div>
        <p style="margin-top: 20px;">
            <input type="submit" value="Create Patient" class="btn btn-primary btn-large" />&nbsp;&nbsp;<%: Html.ActionLink("Cancel", "Index", null, new { @class = "btn btn-large"}) %>
        </p>
    </fieldset>
<% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
    <style>
        .field-validation-error {
            color: #ff0000;
        }
        .field-validation-valid {
            display: none;
        }
        .input-validation-error {
            border: 1px solid #ff0000;
            background-color: #ffeeee;
        }
        .validation-summary-errors {
            font-weight: bold;
            color: #ff0000;
        }
        .validation-summary-valid {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LogoutHolder" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
   <script>
       $(document).ready(function () {
           $("#DOB").datepicker({
               changeMonth: true,
               changeYear: true,
               yearRange: '1900:<%: DateTime.Now.Year %>'
           });
       });
   </script>
</asp:Content>
