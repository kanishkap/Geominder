function Delete_Button_Call(Sid) {	
	$.post("http://localhost:8080/StickyNote/DeleteServlet", {
		sid : Sid	
	
	} );
}

function Update_Button_Call(Sid,start,end,Status,msg,address) {
	var startDateVal=$('#'+ start).val();
	var endDateVal=$('#'+ end).val();
	//var statusVal=$('#'+"input[name='status']:checked").val();
	var statusVal=$('#'+ Status).val();
	var messageVal=$('#'+ msg).val();
	var addressVal=$('#'+ address).val();
	$.post("http://localhost:8080/StickyNote/UpdateServlet", {
		sid : Sid,
		start_date : startDateVal,
		end_date :endDateVal, 
		status : statusVal,
		message : messageVal,
		address : addressVal

	});
}