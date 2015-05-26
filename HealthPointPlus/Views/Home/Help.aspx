<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Help | HealthPoint Plus
</asp:Content>

<asp:Content ID="HelpLogout" ContentPlaceHolderID="LogoutHolder" runat="server">
<% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Application Help</h2>

<div class="row-fluid">
    <div class="span8">
        <div id="accordian">
            <h3>Logging In</h3>
            <div>
                Upon initial startup, the login screen will be displayed.  To access the HPP application you must first login with your username and password. 
                    If you do not have login credentials, a new user can create a username and password by selecting “Register” and following the instructions on the form.
                    Upon successful login or registration the welcome screen will be displayed.
                
            </div>
            <br />
            <h3>Navigation Utility</h3>
            <div>
                Within the navigation utility all navigation related functions are accessed.  These functions include creating a new route, viewing a route, editing/deleting a route, and optimizing a route.
                  <br /><br />
                   <strong>Create a New Route:</strong>
                    <ul>
                        <li>Enter an address into the textbox. </li>
                        <li>Click “Add” button.</li>
                        <li>Repeat until all waypoints are added.</li>  
                        <li>Enter a name for this route.</li>
                        <li>Click “Save” button.</li>
                    </ul> 
                  <br /><br />
                   <strong>View a Route:</strong>
                <ul>                
                    <li>Open the main Navigation screen.</li>
                    <li>Select “View/Edit Routes” button.</li>
                    <li>Select the desired route by clicking on “Details” button.</li>
                    <li>The selected Route will be displayed.</li>
                    <li>Click “Show Directions” button to display step-by-step driving directions.</li>
                </ul>
                <br /><br />
                <strong>Edit a Route:</strong>
                <ul>
                    <li>Open the main Navigation screen (refer to instructions above).</li>
                    <li>Select “View/Edit Routes” button.</li>
                    <li>Select the desired route by clicking on “Details” button.</li>
                    <li>The selected Route will be displayed.</li>
                    <li>Click “Delete” button to delete the chosen waypoint from the route.</li>
                    <li>Confirm delete of selected waypoint or cancel.</li>
                </ul>
                <br /><br />
                <strong>Delete a Route:</strong>
                <ul>
                    <li>Open the main Navigation screen (refer to instructions above).</li>
                    <li>Select “View/Edit Routes” button.</li>
                    <li>Select the desired route to delete by clicking on “Delete” button.</li>
                    <li>Optimize a Route</li>
                    <li>After all waypoints have been added and route name saved, the route will be automatically optimized.</li>
                </ul>
            </div>
            <br />
            <h3>Patient Data Utility</h3>
            <div>
                All patient data functions are accessed within the Patient Data utility.  These functions include adding a new patient, editing a patient, deleting a patient, and 
                creating an appointment.
                <br /><br />
                <strong>Add a new Patient:</strong>
                <ul>
                    <li>Click “Patient Data” button from the main menu.</li>
                    <li>Click “New Patient” button.</li>
                    <li>Enter demographic data as prompted.</li>
                    <li>When all data is entered, click “Create Patient” button.</li>
                </ul>
                <br /><br />
                <strong>Edit a Patient Record:</strong>
                <ul>
                    <li>Navigate to Patient Data screen.</li>
                    <li>Select desired patient and click “Details” button.</li>
                    <li>The Patient Details screen will be displayed.</li>
                    <li>Click “Edit Patient” button.</li>
                    <li>Update patient data fields as needed.</li>
                    <li>Click “Save” button to save updates.</li>
                </ul>
                <br /><br />
                <strong>Delete a Patient Record:</strong>
                <ul>
                    <li>Navigate to Patient Data screen.</li>
                    <li>Click “Delete” button for patient to delete from list.</li>
                    <li>Follow instructions as prompted.</li>
                </ul>
                <br /><br />
                <strong>Create an Appointment:</strong>
                <ul>
                    <li>Navigate to Patient Data screen.</li>
                    <li>Select desired patient and click “Details” button.</li>
                    <li>The Patient Details screen will be displayed.</li>
                    <li>Click “Create Appointment” button.</li>
                    <li>Fill out the Appointment form as required and click "Save".</li>
                </ul>
            </div>
        </div>
    </div>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
      <script>
          $(function () {
              $("#accordion").accordion({
                  heightStyle: "content"
              });
          });
  </script>
</asp:Content>
