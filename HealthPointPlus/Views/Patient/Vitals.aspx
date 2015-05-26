<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HealthPointPlus.Models.Vitals>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Vitals
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Collect Vitals</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Vitals</legend>
    <div class="row-fluid">
        <div class="span4">
            Patient<br />
            <% List<HealthPointPlus.Models.Patient> pts = ViewBag.Patients; %>            
            <% if (pts != null){ %>
                   <select id="PatientId" name="PatientId">
                <%   foreach (var item in pts ){ %>
               <option value="<%: item.ID %>"><%: item.LastName %>, <%: item.FirstName %> <%: item.MiddleInitial %></option>
                <% } %>
            </select><br />
            <%: Html.ValidationMessageFor(model => model.PatientId) %>
            <% } %>                            
        </div>

        <div class="span4">
          Pulse<br />
            <%: Html.EditorFor(model => model.Pulse) %><br />
            <%: Html.ValidationMessageFor(model => model.Pulse) %>
        </div>

        <div class="span4">
           Respiratory Rate<br />
            <%: Html.EditorFor(model => model.RespiratoryRate) %><br />
            <%: Html.ValidationMessageFor(model => model.RespiratoryRate) %>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
         Body Temperature<br />
            <%: Html.EditorFor(model => model.BodyTemperature) %><br />
            <%: Html.ValidationMessageFor(model => model.BodyTemperature) %>
        </div>

        <div class="span4">
           Blood Pressure<br />
            <%: Html.EditorFor(model => model.BloodPressure) %><br />
            <%: Html.ValidationMessageFor(model => model.BloodPressure) %>
        </div>
        <div class="span4">
           Date Taken<br />
            <%: Html.EditorFor(model => model.Date) %><br />
            <%: Html.ValidationMessageFor(model => model.Date) %>
        </div>
    </div>
   <div class="row-fluid" style="margin-top:20px;">
        <div class="span12">
            <input type="submit" value="Add Vitals" class="btn btn-large btn-primary" />&nbsp;&nbsp;
            <% if (ViewBag.Return == null){ %>
            <%: Html.ActionLink("Cancel", "Forms", null, new { @class = "btn btn-large" })%>
            <% }else{ %>
            <%: Html.ActionLink("Cancel", "Details", "Patient", new { ID = ViewBag.Return }, new { @class = "btn btn-large" })%>
            <% } %>
        </div>
    </fieldset>
<% } %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LogoutHolder" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
 <script>
     $(document).ready(function () {
         $("#Date").val(null);
    $("#Date").datepicker({
                changeMonth: true,
                changeYear: true,
                defaultDate: new Date(),                
                yearRange: '<%: DateTime.Now.Year %>:<%: DateTime.Now.AddYears(1).Year %>'
            });
     });
  </script>
</asp:Content>
