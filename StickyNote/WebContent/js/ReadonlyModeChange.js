function ToggleReadOnlyState (startdate,enddate,msg,status) {
	alert(startdate);
	
    var text = document.getElementById (startdate);
    text.readOnly = !text.readOnly;
 
    var text = document.getElementById (enddate);
   text.readOnly = !text.readOnly;
   
   var textarea = document.getElementById (msg);
   textarea.readOnly = !textarea.readOnly;
   
   var text = document.getElementById (status);
   text.readOnly = !text.readOnly;
   
   $(function() {
	    $( "[name='start_date'],[name='end_date']" ).datepicker(
	    { minDate: 0,
	    dateFormat: 'yy-mm-dd'
	    });
	  });
   
}





