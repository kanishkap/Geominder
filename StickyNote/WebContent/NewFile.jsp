<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
String sql = "select distinct * from "+TableName+ " where address like '%"+SerachLocation+"%'";
//String sql="select * from sticky " address // tabel namme sahi hai?????????????????????????????????????????????????????????????
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "root");
System.out.println(sql);
PreparedStatement ps;
ps = connection.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	System.out.println(rs.getString(6));
}
%>
</body>
</html>