<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<HealthPointPlus.Models.Waypoints>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Route Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Route Details for <%: ViewBag.RouteName %></h2>
      <% if (Request.Params.Get(1) == "delete_waypoint"){ %>
    <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Success</h4>
            The selected waypoint has been deleted from the route and database.
     </div>
    <% }else if(Request.Params.Get(1) == "unauthorized"){ %>
    <div class="alert alert-error">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Unauthorized Access</h4>
            You are not authorized to delete the selected waypoint.  Users may only delete waypoints associated with routes they create or are assigned.
     </div>
    <% } %>
<table class="table table-bordered table-striped">
    <thead style="font-weight: bold;">
        <td>
            Order
        </td>
        <td>
            Address
        </td>
        <td>
            Latitude
        </td>
        <td>
            Longitude
        </td>
        <td>
            Actions
        </td>
    </thead>
   <tbody>
       <%
           var lastItem = Model.Last<object>();
           var firstItem = Model.First<object>();
            %>
       <script>
          
       </script>
<% foreach (var item in Model) { %>
    <tr>
        <td>
             <%: Html.DisplayFor(modelItem => item.Order) %>
            <input type="hidden" value="<%: item.Lat %>,<%: item.Lng %>" id="<% if (firstItem.Equals(item)) { %>route_start<% }else if(lastItem.Equals(item)){ %>route_end<% }else{ %>wpt_<%: item.Order %><% } %>"  />
        </td>
        <td id="waypoint_address_<%: item.Order %>">           
            <%: Html.DisplayFor(modelItem => item.Address) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Lat) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Lng) %>
        </td>
        <td>
             <a href="#" onclick="deleteConfirm(<%: item.ID %>, <%: item.RouteId %>)" class="btn btn-small btn-danger">Delete</a>            
        </td>
    </tr>
<% } %>
       </tbody>
</table>        
   <div class="row-fluid">
    <div id="map_canvas" class="span8" style="height:400px; width: 600px; margin-left: 5%"></div>         
    <div class="span4">
        <div class="row-fluid" style="text-align: center">
            <button id="showDirections" class="btn btn-primary btn-large">Show Directions</button>
            <button id="hideDirections" style="display: none" class="btn btn-primary btn-large">Hide Directions</button>
        </div>
        <div class="row-fluid">
            <div id="directions_panel" style="display: none; width: 100%" class="span4"></div>
        </div>
    </div>    
  </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
        <style>
#map-canvas {
  margin: 0;
  padding: 0;
  height: 100%;
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

<asp:Content ID="Content4" ContentPlaceHolderID="LogoutHolder" runat="server">
     <% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
     <script src="//maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&extension=.js"></script>
    <script>     
        //Confirmation delete dialog box
        function deleteConfirm(itemId, routeId) {
            var r = confirm("Are you sure you want to permanently delete this waypoint?");
            if (r == true) {
                window.location.href = "../Routes/DeleteWaypoint?waypoint=" + itemId + "&return=" + routeId;
            }
        }
        $(document).ready(function () {
            //jQuery functions to set up our view
            $("#directions_panel").hide();
            $("#showDirections").click(function () {
                $(this).hide();
                $("#hideDirections").show();
                $("#directions_panel").slideDown(1000);
            });

            $("#hideDirections").click(function () {
                $(this).hide();
                $("#showDirections").show();
                $("#directions_panel").slideUp(1000);
            });

            //Everything below is for the Google Maps API
            var map;
            var geocoder = new google.maps.Geocoder();
            var start;
            var end;
            var waypts = [];
            var directionsService = new google.maps.DirectionsService();
            var directionsDisplay = new google.maps.DirectionsRenderer();
            calcRoute();  
            //setAddresses();
            function initialize() {
                
                directionsDisplay = new google.maps.DirectionsRenderer();
                directionsDisplay.setPanel(document.getElementById('directions_panel'));
                var mapOptions = {
                    zoom: 5,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById('map_canvas'),
                    mapOptions);
                directionsDisplay.setMap(map);
                // Try HTML5 geolocation
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        //var pos = new google.maps.LatLng(position.coords.latitude,
                        //                                 position.coords.longitude);
                        //map.setCenter(pos);
                        var startParts = start.split(',', 2);
                        var rtCenter = new google.maps.LatLng(startParts[0],
                                                             startParts[1]);
                        map.setCenter(rtCenter);
                    }, function () {
                        handleNoGeolocation(true);
                    });
                } else {
                    // Browser doesn't support Geolocation
                    handleNoGeolocation(false);
                }
            }
           
            function setAddresses() {
                //alert(itemId);
                for (var i=1; i<=$("input").length;i++){
                    var latlon;
                    if (i == 1){
                        latlon = $("#route_start").val();
                    }else if(i == $("input").length){
                        latlon = $("#route_end").val();
                    }else{
                       latlon = $("#wpt_"+i).val();
                    }
                    //alert(latlon);
                    //$("#waypoint_address_" + i).html(reverseGeocode(latlon));
                    document.getElementById("waypoint_address_" + i).innerHTML = reverseGeocode(latlon);
                }
                //document.getElementById(itemId).innerHTML = reverseGeocode(latlon);                
                //alert(latlon);
            }
            //Calculate the route based on the waypoints in the HTML form
            function calcRoute() {
                start = $("#route_start").val();
                end = $("#route_end").val();                
                if ($("input").length > 2) {
                    for (var i = 2; i <= $("input").length-1; i++) {
                        if ($("#wpt_" + i).val() != null) {
                            //var addy = reverseGeocode($("#wpt_" + i).val());                            
                            //if (addy != null) {
                            //    waypts.push({ location: addy, stopover: true });                          
                            //} else {
                               waypts.push({ location: $("#wpt_" + i).val(), stopover: true });                                
                            
                        } 
                    }
                }
            }            
            //Get an address from a LatLon coordinate
            function reverseGeocode(latlong) {
                var latlngParts = latlong.split(',', 2);
                var lat = parseFloat(latlngParts[0]);
                var lng = parseFloat(latlngParts[1]);
                var latlng = new google.maps.LatLng(lat, lng);
                if (latlngParts[0] != null && latlngParts[1] != null) {
                    geocoder.geocode({ "latLng": latlng}, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            if (results[1]) {
                                //alert(results[1].formatted_address);
                                return results[1].formatted_address;
                            }
                        } else {
                            alert('Geocode was not successful for the following reason: ' + status);
                        }
                    });
                } else {
                    return latlong;
                }
            }

            var request = {
                origin: start,
                destination: end,
                waypoints: waypts,
                optimizeWaypoints: true,
                travelMode: google.maps.TravelMode.DRIVING
            };

            //Display the directions list
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });

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
       });
    </script>

</asp:Content>
