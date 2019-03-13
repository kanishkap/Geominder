<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyCXs_YJYqMk2lgMhY3m7BUPItkQBpDzRzc&libraries=places&callback=initMap&language=de"></script>
</head>
<body>

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