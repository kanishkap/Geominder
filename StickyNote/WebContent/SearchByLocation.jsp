<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
function fetch_Call() {
	$.post("http://localhost:8080/StickyNote/SearchByLocation", {
		textfield1 : $('textfield1').val(),
		
	}/*,
	function(result) {
		$('#sid').html(result); // message you want to show
	}*/);
}
</script>
<%
	Connection connection = null;
	String email = (String) session.getAttribute("email");
	String address=request.getParameter("address");
	String sql = "select * from sticky" + email.split("@")[0] + "textfield1="+address+"'";
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "root");
	PreparedStatement ps;
	ps = connection.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();

	String id;
%>

<body>
<jsp:include page="Header.jsp" />
<div class="content">
			<form method="get" action="#">
				<div>
					<input type="text" id="textfield1" name="textfield1" value="" size="18" style="margin-left: 548px;margin-top: 38px;width: 261px;" />
					<input type="submit" id="submit1" name="submit1" value="Go" onclick="fetch_Call()" />
				</div>
			</form>
		</div>
<div class="sticky-note-pre-main ui-widget-content">
		<%
			while (rs.next()) {
				String sid = rs.getString(1);
				String start_date = rs.getString(2);
				String end_date = rs.getString(3);
				String status = rs.getString(4);
				String message = rs.getString(5);
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
</body>
</html>