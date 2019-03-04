<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="Design.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>

<body id="body">
        <a href="LogoutServlet" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> Log out
        </a>
 
<center>
<p id="p1"> Geominder </p>
<input type="button" value="My Notes"  onclick="document.location.href ='MyNote.jsp'">
<input type="button"  value="Add Note" onclick="document.location.href ='StickyNote.jsp'"> 
<input type="button"  value="Search by location" onclick="document.location.href ='SearchByLocation.jsp'">
<input type="button" value="Search by Date"  onclick="document.location.href ='SearchByDate.jsp'"> 

</center>
</body>
</html>