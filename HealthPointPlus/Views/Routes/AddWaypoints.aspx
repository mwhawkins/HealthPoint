<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add Waypoints | HealthPoint Plus
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Create Route and Add Waypoints</h2><br />
<div class="row-fluid">
    <div class="span9">
        <div class="row-fluid">
            <div class="span12 input-append" style="text-align:center">
               <input class="input" id="waypointAddress" type="text" style="height: 32px" placeholder="Enter Address..." /><a id="addButton" href="#" class="btn btn-primary" onclick="codeAddress()">Add</a>
            </div>
        </div>
        <div class="row-fluid"  style="margin-left: 5%">
            <div id="map_canvas" class="span12" style="height:400px; width: 600px; margin-left: 5%"></div>
        </div>
    </div>
    <div class="span3"> 
       <p style="margin-bottom: 15px;"><input type="text" style="height: 32px" class="input" name="routeName" id="routeName" placeholder="Enter Route Name..." /></p>
        <a class="btn btn-large btn-primary" onclick="saveAndExit()">Save</a>&nbsp;&nbsp;  
        <a class="btn btn-large btn-danger" onclick="quitNoSave()">Quit</a>     
        <div class="pointInfo" style="margin: 30px 0 0 0; display: none"></div>
        <p style="margin-top: 30px;"><strong>Instructions:</strong><br />
            Enter an address into the textbox on this page, then click the "Add" button. A confirmation dialog will appear and a marker will be placed on the map in the appropriate location. Repeat until desired number of waypoints are added (up to 5).<br /><br />When finished adding waypoints, enter a name for this route into the textbox above and click the "Save" button to generate the new route.
        </p>
    </div>
</div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LogoutHolder" runat="server">
    <% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadCSS" runat="server">
  <style>
html, body, #map-canvas {
  margin: 0;
  padding: 0;
  height: 100%;
}
      .btn {
          font-size: 18px;
          padding: 10px 20px;
      }
#map_canvas img { 
  max-width: none;
}

#map_canvas label { 
  width: auto; display:inline; 
} 

@media print {
  html, body {
    height: auto;
  }

  #map-canvas, #map_canvas {
    height: 650px;
  }
}

#panel {
  position: absolute;
  top: 5px;
  left: 50%;
  margin-left: -180px;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
}
  </style>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ScriptsSection" runat="server">
     <script src="//maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&extension=.js"></script>
    <script>       
            var map;
            var geocoder;
            var allPoints = new Array();
            var addresses = [];
            var waypoint = {};
            function initialize() {
                var mapOptions = {
                    zoom: 12,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById('map_canvas'),
                    mapOptions);

                // Try HTML5 geolocation
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        var pos = new google.maps.LatLng(position.coords.latitude,
                                                         position.coords.longitude);                       
                        map.setCenter(pos);
                    }, function () {
                        handleNoGeolocation(true);
                    });
                } else {
                    // Browser doesn't support Geolocation
                    handleNoGeolocation(false);
                }
                geocoder = new google.maps.Geocoder();
            }

        /**
        *Function to geocode input addresses to point coordinates
        */
            function codeAddress() {
                var address = document.getElementById('waypointAddress').value;
                geocoder.geocode({ 'address': address }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        map.setCenter(results[0].geometry.location);                        
                       var marker = new google.maps.Marker({
                           map: map,
                            position: results[0].geometry.location
                        });
                        //allPoints.push(results[0].geometry.location);                        
                       //waypoint = results[0].geometry.location;
                       allPoints.push(results[0].geometry.location);
                       addresses.push({ address: results[0].formatted_address });
                       waypoint = {};
                        alert("Waypoint Added");
                        updateScreen();                        
                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            }

        /**
        *Function to refresh page content after an update
        */
            function updateScreen() {
                $("div.pointInfo").show();
                if (allPoints.length == 1) {
                    $("div.pointInfo").html("<p>You have " + allPoints.length + " waypoint in this route.</p>");
                } else if (allPoints.length > 0) {
                    $("div.pointInfo").html("<p>You have " + allPoints.length + " waypoints in this route.</p>");
                }
            }

        /**
        *Function to provide user with a confirm box after clicking the "quit" button
        */
            function quitNoSave() {
                var r = confirm("Are you sure you want to exit without saving?\n\nClick OK to quit or CANCEL to remain on this page.");
                if (r == true) {
                    window.location.href = "../Home/Navigation";
                }
            }

        /**
        *Function to save waypoints back to the database and redirect to navigation page
        */
            function saveAndExit() {
                //Push Waypoint array (allPoints) back to server, save in database
                //then redirect to navigation page, showing the new route.
                if (allPoints.length > 0) {
                    $(function () {
                        //var routeNameText = $(".routeName").val();
                        var postData = { waypoints: JSON.stringify(allPoints), routeName : $("#routeName").val(), addresses: JSON.stringify(addresses) };
                        //postData.waypoints = allPoints;
                        //postData.routeName = $(".routeName").val();
                        //POST the waypoints back via AJAX, on success we redirect to the View page
                        $.ajax({
                            type: 'POST',
                            cache: false,
                            dataType: 'json',
                            url: '../Routes/SaveWaypoints',
                            data: postData,
                            //contentType: 'application/json; charset=utf-8',
                            async: false,
                            traditional: true,
                            success: function (data) {
                                //alert(JSON.stringify(postData));
                                window.location.href = "../Routes/ViewRoutes?result=added_route";
                            },
                            error: function (data) {
                                alert("Something went wrong. Unable to save.");
                            }
                        });
                    });
                } else {
                    //No waypoints found, so we send up a message to the user
                    var r = confirm("No waypoints were found. Are you sure you want to exit?\n\nClick OK to return to the Navigation screen or CANCEL to remain on this page.");
                    if (r == true) {
                        window.location.href = "../Home/Navigation";
                    }                    
                }
            }

        /**
        *Function to handle browsers which don't support HTML5 Geolocation API
        */
            function handleNoGeolocation(errorFlag) {
                if (errorFlag) {
                    var content = 'Error: The Geolocation service failed.';
                } else {
                    var content = 'Error: Your browser doesn\'t support geolocation.';
                }

                var options = {
                    map: map,
                    position: new google.maps.LatLng(60, 105),
                    content: content
                };

                var infowindow = new google.maps.InfoWindow(options);
                map.setCenter(options.position);
            }

            google.maps.event.addDomListener(window, 'load', initialize);

        /**
        *jQuery functions to clean up input textbox
        */
            $(document).ready(function () {
                $("#addButton").click(function () {
                    $("#waypointAddress").val("");
                });                
            });
    </script>
</asp:Content>
