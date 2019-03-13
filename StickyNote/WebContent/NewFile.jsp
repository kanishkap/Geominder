<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" type="text/javascript"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyCXs_YJYqMk2lgMhY3m7BUPItkQBpDzRzc&libraries=places&callback=initMap&language=de"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/StickyNoteNote.css">
<link href="Design.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/MyNotes.css">
<link rel="stylesheet" type="text/css" href="css/Notification.css">
<script src="js/Notification.js" type="text/javascript"></script>
<script type="text/javascript" src="js/UpdateAndDelete.js"></script>
<link rel="stylesheet" type="text/css" href="css/Map.css">
<script type="text/javascript" src="js/Auto.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String SerachLocation=request.getParameter("textfield1");
System.out.println(SerachLocation);
Connection connection = null;
String email = (String) session.getAttribute("email");
String address=request.getParameter("address");
String TableName="sticky"+email.split("@")[0];
String sql = "select * from "+TableName+ " where address like '%"+SerachLocation+"%'";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "root");
System.out.println(sql);
PreparedStatement ps;
ps = connection.prepareStatement(sql);

ResultSet rs = ps.executeQuery();
while(rs.next()){
	String sid = rs.getString(1);
	String start_date = rs.getString(2);	
	String end_date = rs.getString(3);
	String status = rs.getString(4);
	String message = rs.getString(5);
	String location = rs.getString(6);
	System.out.println(sid+' '+start_date+' '+end_date+' '+status+' '+message+' '+location);
	
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
<div class="pac-card" id="pac-card">
  <div id="pac-container">
    <input id=id="pac-input_<%=sid%>" type="text" autocomplete="off" onkeyup="initMap()" value="<%=location%>">
  </div>
</div>
<div id="map"></div>
</div>

<!--  
	<div class="absolute">
	<div class="pac-card" id="pac-card">
		<div id="pac-container">
		<input type="text" id="pac-input_<%=sid%>" onkeyup="initMap()" value="<%=address%>">
	</div>
	</div>
	<div id="map"></div>
</div>-->

</div>

</div>

<%
}
%>


<div id="saved_sucessfull">Saved Sucessfully</div>
<div id="deleted_sucessfull">Deleted Sucessfully</div>

</body>
</html>