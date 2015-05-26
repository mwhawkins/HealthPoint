<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<HealthPointPlus.Models.Routes>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    View and Edit Routes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">View and Edit Routes</h2>
     <% if (Request.Params.Get(0) == "delete_route"){ %>
    <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Success</h4>
            The selected Route has been deleted from the database and is no longer in your Route List.
     </div>
    <% }else if(Request.Params.Get(0) == "unauthorized"){ %>
    <div class="alert alert-error">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Unauthorized Access</h4>
            You are not authorized to delete the selected route.  Users may only delete routes that they create or are assigned.
     </div>
    <% }else if(Request.Params.Get(0) == "added_route"){  %>    
    <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Success!</h4>
            Your route has been generated based on the waypoints provided. You should see it in the Route List below.
     </div>
    <% } %>
<p>
      <a href="../Routes/AddWaypoints" class="btn btn-large btn-primary">Create New Route</a>
</p>
<table class="table table-bordered table-striped">
    <thead style="font-weight: bold;">
        <td>
            Route Name
        </td>
        <td>
            <%: Html.DisplayNameFor(model => model.Description) %>
        </td>
        <td>
            Actions
        </td>
    </thead>
   <tbody>
<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Description) %>
        </td>
        <td>
            <a href="../Routes/RouteDetails?route=<%: item.ID %>" class="btn btn-small btn-primary">Details</a>
             <a href="#" onclick="deleteConfirm(<%: item.ID %>)" class="btn btn-small btn-danger">Delete</a>            
        </td>
    </tr>
<% } %>
       </tbody>
</table>    
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
       //Delete confirmation dialog box
       function deleteConfirm(itemId) {
           var r = confirm("Are you sure you want to permanently delete this route?");
           if (r == true) {
               window.location.href = "../Routes/DeleteRoute?route=" + itemId;
           }
       }
   </script>

</asp:Content>
