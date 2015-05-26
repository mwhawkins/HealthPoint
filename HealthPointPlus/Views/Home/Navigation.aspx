<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Navigation |  HealthPoint Plus
</asp:Content>

<asp:Content ID="NavigationLogout" ContentPlaceHolderID="LogoutHolder" runat="server">
<% if (User.Identity.IsAuthenticated){ %>
    <span style="float: right; font-size: 16px; color: #000"><a href="../Account/LogOff">Log Off</a></span>
<% } %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2 style="font-weight: 300;">Navigation</h2>
    <% if (Request.Params.Get(0) == "added_route"){ %>
    <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4 style="line-height: 1.5">Success!</h4>
            Your route has been added and is now being generated based on the waypoints provided. You should see it shortly in your Route List.
     </div>
    <% }else{ %>
        <br />
    <% } %>
<div class="row-fluid">
    <div class="span9">
        <div class="row-fluid"  style="margin-left: 5%">
            <div id="map_canvas" class="span12" style="height:400px; width: 600px; margin-left: 5%"></div>
        </div>
        <div class="row-fluid" style="margin-top: 30px;">
            <div class="span12" style="text-align: center">
                <a href="../Routes/AddWaypoints" class="btn btn-primary">New Route</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="../Routes/ViewRoutes" class="btn btn-primary">View/Edit Routes</a>
            </div>
        </div>
    </div>
    <div class="span3"><a class="btn btn-large btn-danger" href="../Home/Index">Quit Navigation</a></div>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadCSS" runat="server">
  <style>
#map-canvas {
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

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
     <script src="//maps.googleapis.com/maps/api/js?v=3.exp&sensor=true&extension=.js"></script>

    <script>
        $(document).ready(function () {
            //Google Maps API functions
            var map;
            var geocoder;
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

                        var infowindow = new google.maps.InfoWindow({
                            map: map,
                            position: pos,
                            content: '<br />Your estimated location was found.'
                        });

                        map.setCenter(pos);
                    }, function () {
                        handleNoGeolocation(true);
                    });
                } else {
                    // Browser doesn't support Geolocation
                    handleNoGeolocation(false);
                }
                
            }

            //If the browser doesn't support Geolocation, send a warning message
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
