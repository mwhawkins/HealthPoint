<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<HealthPointPlus.Models.Patient>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Patient List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Patient Data</h2>
    <hr style="margin-top: 10px; margin-bottom: 35px;" />
     <% if (ViewBag.ActionName == "patient_added"){ %>
    <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Success!</h4>
            The patient has been added to the database and appears in the list below.
     </div>
    <% }else if(ViewBag.ActionName == "patient_error"){ %>
    <div class="alert alert-error">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Oops!</h4>
            Something went wrong and we weren't able to save the patient to the database.  Did you verify you have all the required fields and data?
         If so, please try again.
     </div>
    <% }else if(ViewBag.ActionName == "patient_deleted"){  %>
    <div class="alert alert-info">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Patient Deleted</h4>
            The selected patient was deleted from the database successfully.
     </div>
    <% } %>
<div class="row-fluid">
<div class="span2">
    <a href="../Patient/Create" class="btn btn-primary btn-large" style="width: 75%">New Patient</a><br /><br />
    <a href="../Patient/Forms" class="btn btn-large" style="width: 75%">All Forms</a>
</div>
<div class="span10">
<h4 style="font-weight: 300; margin-top: 0px;">Patient List</h4>
<table class="table table-bordered table-striped" style="width: 100%">
    <thead>
        <th>
            Name
        </th>
        <th>
            Date of Birth
        </th>
        <th>
           Address
        </th>
        <th>
            Phone
        </th>        
        <th>Actions</th>
    </thead>
    <tbody>
<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.LastName) %>, <%: Html.DisplayFor(modelItem => item.FirstName) %>  <%: Html.DisplayFor(modelItem => item.MiddleInitial) %>            
        </td>
        <td>
            <%: item.DOB.ToShortDateString() %>
        </td>
        <td>
           <%: item.Address %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Phone) %>
        </td>
        <td>
            <%: Html.ActionLink("Details", "Details", new { id=item.ID }, new { @class = "btn btn-primary btn-small"}) %> |
            <a href="#" class="btn btn-small btn-danger" onclick="deleteConfirm(<%: item.ID %>)">Delete</a>
        </td>
    </tr>
<% } %>
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
    <script>
        function deleteConfirm(itemId) {
            var r = confirm("Are you sure you want to permanently delete this patient record?");
            if (r == true) {
                window.location.href = "../Patient/Delete/" + itemId;
            }
        }
    </script>
</asp:Content>
