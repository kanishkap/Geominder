<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>

<p id="demo"></p>
<input type="hidden" id="latitude">
<input type="hidden" id="longitude">


<p>Click the button to get your coordinates.</p>

<p id="de"></p>
<p id="edu"></p>
<p id="fac"></p>
<button onclick="RepeatOneminute()">Try It</button>

<script>
var x = document.getElementById("demo");
var y = document.getElementById("de");
var z = document.getElementById("edu");
var a = document.getElementById("fac");
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
      // above is for 10 seconds      1e6
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
	$.post("http://localhost:8080/StickyNote/GetUrl",		
			{
	latitude: $('#latitude').val(),
	longitude: $('#longitude').val()
			}/* ,
			function(result) {
				$('#demo').html(result); // message you want to show
			} */);
	
	}
</script>

</body>
</html>