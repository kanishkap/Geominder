<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyCXs_YJYqMk2lgMhY3m7BUPItkQBpDzRzc&libraries=places&callback=initMap&language=de"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"
	rel="Stylesheet" type="text/css" />
<link href="Design.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/MyNotes.css">

<link rel="stylesheet" type="text/css" href="css/Notification.css">
<script src="js/Notification.js" type="text/javascript"></script>

<script type="text/javascript" src="js/UpdateAndDelete.js"></script>

<link rel="stylesheet" type="text/css" href="css/Map.css">
<script type="text/javascript" src="js/Auto.js"></script>
<script type="text/javascript">
$(function() {
    $( "[name='start_date'],[name='end_date']" ).datepicker(
    	    { minDate: 0,
    	    dateFormat: 'yy-mm-dd'
    	    });
    	  });
       
      /*  Geolocation pluscode */
       
       function Map(){
	$.post("http://localhost:8080/StickyNote/GetUrl",
			{
	address : $('#pac-input').val()
			},
	
	 function(result) {
		$('#message').html(result); // message you want to show
	} 
	);
}

// Testing ping at server at every 60m sec below
function Pinging(){
	$.post("http://localhost:8080/StickyNote/FetchUrl",
			{
	address : $('#pac-input').val()
			},
	
	function(result) {
		$('#message').html(result); // message you want to show
	});
}
   </script>
</head>

<%
	Connection connection = null;
	String email = (String) session.getAttribute("email");
	String sql = "select * from sticky" + email.split("@")[0];
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "root");
	PreparedStatement ps;
	ps = connection.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();

	String id;
%>
<body>
	<jsp:include page="Header.jsp" />
	<br>
	
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
	
	<div class="sticky-note-pre-main ui-widget-content">
		<%
			while (rs.next()) {
				String sid = rs.getString(1);
				String start_date = rs.getString(2);
				String end_date = rs.getString(3);
				String status = rs.getString(4);
				String message = rs.getString(5);
				String address = rs.getString(6);
		%>
		<div class="sticky-note-pre ui-widget-content">

			<div class="handle">

				<div class="check_icon">
					<i class="fa fa-check" class="update" id="<%=sid%>"
						onclick="Update_Button_Call('<%=sid%>','start_date_<%=sid%>','end_date_<%=sid%>','status_<%=sid%>','msg_<%=sid%>','pac-input_<%=sid%>');saveFunction(); Map()"></i>
				</div>

				<div class="delete_icon">
					<i class="fa fa-trash" class="delete" id="<%=sid%>"
						onclick="Delete_Button_Call(<%=sid%>);deleteFunction()"></i>
				</div>

				<div class="dropDown">
					<input type="text" value="<%=status%>" id="status_<%=sid%>"
						style="width: 100%;">
				</div>
			</div>

			<div class="dates">

				<b>Start:</b><input type="text" id="start_date_<%=sid%>"
					value="<%=start_date%>" style="width: 96px" name="start_date">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>End:</b><input type="text" id="end_date_<%=sid%>"
					value="<%=end_date%>" style="width: 96px;" name="end_date">

			</div>
			<div contenteditable class="contents">
				<input class="message" id="msg_<%=sid%>" type="textarea"
					value="<%=message%>" style="border: none;"> <input
					type="hidden" id="sid" value="<%=sid%>" readonly>
			</div>
			<div class="absolute">

				<%--  <input class="location" type="text" id="address_<%=sid%>"
			value="<%=location%>"> --%>

				<div class="pac-card" id="pac-card">
					<div id="pac-container">
						<input type="text" id="pac-input_<%=sid%>" onkeyup="initMap()"
							value="<%=address%>">
					</div>
				</div>
				<div id="map"></div>
			</div>

		</div>

	</div>

	<%
		}
	%>


	<div id="saved_sucessfull">Saved Sucessfully</div>
	<div id="deleted_sucessfull">Deleted Sucessfully</div>




</body>
</html>