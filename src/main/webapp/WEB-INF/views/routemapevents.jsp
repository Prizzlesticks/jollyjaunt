<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Directions service</title>
<style>
#map {
	height: 100%;
}
</style>
</head>
<!--View route on map based on origin and destinations selected  -->
<!--Link to google maps for full directions/mapping -->
<!--View events selected/submitted from the events view page -->
<body style="text-align: left;">
	<h1>View Your Route</h1>
	Your Starting point is ${origin}
	<br> Your End point is ${destination}
	<div id="map"
		Style="height: 300px; width: 400px; align: right; border: 5px solid black;"></div>

	<script>
		var link = "http://www.google.com/maps/dir/" + "${origin}" + "/"
				+ "${destination}";
	</script>
	<h2>For Full Directions and Voice Mapping</h2>

	<script>
		document.write('<a href="' + link + '" target = blank;>click here</a>');
	</script>
	<script>
		function initMap() {
			var directionsService = new google.maps.DirectionsService;
			var directionsDisplay = new google.maps.DirectionsRenderer;
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 7,
				center : {
					lat : 41.85,
					lng : -87.65
				}
			});
			directionsDisplay.setMap(map);

			calculateAndDisplayRoute(directionsService, directionsDisplay);
		}

		function calculateAndDisplayRoute(directionsService, directionsDisplay) {
			directionsService.route({
				origin : "${origin}",
				destination : "${destination}",
				travelMode : 'DRIVING'
			}, function(response, status) {
				if (status === 'OK') {
					directionsDisplay.setDirections(response);
				} else {
					window.alert('Directions request failed due to ' + status);
				}
			});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzbMMCLqhLp1yFuvPmidlbGCMvIgCm4wg&callback=initMap">
		
	</script>

	<!-- listing events chosen by user from events view page-->
	<br>
	<h3>Your Trip Events:</h3>
	<br>
	<ul>
		<c:forEach var="ev" items="${events}">
			<li>${ev}</li>
		</c:forEach>
	</ul>

</body>
</html>