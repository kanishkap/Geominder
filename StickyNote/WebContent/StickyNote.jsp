<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyCXs_YJYqMk2lgMhY3m7BUPItkQBpDzRzc&libraries=places&callback=initMap&language=de"></script>
<script type="text/javascript" src="js/StickyNote.js"></script>
<script type="text/javascript" src="js/Auto.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/Design.css" rel="stylesheet" type="text/css" />
<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet"type="text/css" />
<link rel="stylesheet" type="text/css" href="css/StickyNote.css">
<link rel="stylesheet" type="text/css" href="css/Map.css">   

</head>
<body>
<!-- To create stickynote -->
	<jsp:include page="Header.jsp" />
	<br>
	<span id="span">
		<div class="add_icon">
			<i class="fa fa-plus" id="new"></i>
		</div> Double-click to Add Notes
	</span>
	<div id="notes"></div>
 <!-- Pinging to get the latitude and longitude -->	
<p id="demo" style="display: none;"></p>
<input type="hidden" id="latitude">
<input type="hidden" id="longitude">

<button onclick="RepeatOneminute()" style="display: none;">Try It</button>

<script>
var x = document.getElementById("demo");
let i = 0;
let j = 0;

function myFunction() {
//  setInterval(function(){ alert(y.innerHTML); }, 5000);
  setInterval(function(){ RepeatOneminute(); }, 5000);
}
	
function RepeatOneminute()
{
  function count() 
  {
    for (let j = 0; j < 10000; j++) 
	{
      i++;
      // above is for 10 seconds     
    }
	y.innerHTML = i;
  }
	getLocation();
	a.innerHTML="After Location"+i;
	count();
	z.innerHTML="After count"+i;
}

function getLocation() {
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
	
  x.innerHTML = "Latitude: " + position.coords.latitude +   "<br>Longitude: " + position.coords.longitude+" <br>Position:	";
  document.getElementById("latitude").value=position.coords.latitude;
 document.getElementById("longitude").value=position.coords.longitude;
 getLatLong();
}
window.onload = myFunction;

function getLatLong()
{
	//$.post("http://localhost:8080/StickyNote/FetchURL",
	$.post("http://localhost:8080/StickyNote/FetchUrl",		
			{
	latitude: $('#latitude').val(),
	longitude: $('#longitude').val()
			},
			function(result) {
				$('#demo').html(result); // message you want to show
			});
	
	}
</script> 



<!-- End of Pinging to get the latitude and longitude -->	
	
</body>
</html>