
zIndex = 10;

$( document ).ready(function() {
console.log( "ready!" );

$('#new').click(function(){
/*alert('Inside new');*/
$('#notes')
	.append('\
		<div class="sticky-note-pre ui-widget-content">\
			<div class="handle">&nbsp;<div class="close">&times;</div>\
		     <div class="check_icon"><i class="fa fa-check" onclick="Save_Button_Call();Map()" id="save"></i></div>\
			<div class="dropDown" id="status">\
			<select rquired>\
			<option value="">Select Status..</option>\
  <option value="Open">Open</option>\
  <option value="Closed">Completed</option>\
</select></div>\</div>\
			<div class="absolute"> \
			<div class="pac-card" id="pac-card">\
		      <div id="pac-container">\
		        <input id="pac-input" type="text" autocomplete="off" onkeyup="initMap()" placeholder="Enter a location">\
		      </div>\
		    </div>\
			<div id="map"></div>\
</div>\
	 <div class="dates"><b>Start:</b><input type="text" id="start_date" style="width: 96px;" autocomplete="off" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>End:</b><input type="text" id="end_date" style="width: 96px;" autocomplete="off" required></div>\
			<div contenteditable class="contents" id="message">awesome</div>\
	</div>\
	 ')
	 
	
	.find('.sticky-note-pre')
		//.position where we want it
	.end()
	//.do something else to $('#notes')
	;
$('.sticky-note-pre')
	.draggable({
		handle: '.handle'    
	})
	.resizable({
		resize: function(){
			var n = $(this);
			n.find('.contents').css({
				width: n.width() - 40,
				height: n.height() - 60
			});
		}
	})
	.bind('click hover focus mousedown', function(){
		$(this)
			.css('zIndex', zIndex++)
			.find('.ui-icon')
				.css('zIndex', zIndex++)
			.end()
		;
	})
	.find('.close')
		.click(function(){
			$(this).parents('.sticky-note').remove();
		})
	.end()
	.dblclick(function(){
		$(this).remove();
	})
	.addClass('sticky-note')
	.removeClass('sticky-note-pre')
	;

/*DATE VALIDATION USING DATEPICKER*/

/*$(function() {
    $( "#start_date,#end_date" ).datepicker(
    { minDate: 0,
    dateFormat: 'yy-mm-dd'
    });
  });
*/
var dateToday = new Date();
var dates = $("#start_date, #end_date").datepicker({
    defaultDate: "+1w",
    changeMonth: true,
    numberOfMonths: 1,
    dateFormat:'yy-mm-dd',
    minDate: dateToday,
    onSelect: function(selectedDate) {
        var option = this.id == "start_date" ? "minDate" : "maxDate",
            instance = $(this).data("datepicker"),
            date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
        dates.not(this).datepicker("option", option, date);
    }
});

});
});

$('#save').click(function(){
alert('Inside save');
var notes = [], i, note;
$('.sticky-note').each(function(){
	notes.push($(this).find('.contents').html());
});
//do something with notes
console.log(notes);
});

/*Jquery ajax to send data on insertservlet*/
function Save_Button_Call() {
	$.post("http://localhost:8080/StickyNote/InsertServlet", {
		start_date : $('#start_date').val(),
		end_date : $('#end_date').val(),
		status : $('#status option:selected').text(),
		message : $('#message').text(),
		address : $('#pac-input').val()
		
	}/*,
	function(result) {
		$('#sid').html(result); // message you want to show
	}*/);
}

// On key up address 
function Map(){
	$.post("http://localhost:8080/StickyNote/GetUrl",
			{
	address : $('#pac-input').val()
			}/*,
	
	function(result) {
		$('#message').html(result); // message you want to show
	}*/);
}

// Testing ping at server at every 60m sec below
function Pinging(){
	$.post("http://localhost:8080/StickyNote/FetchUrl",
			{
	address : $('#pac-input').val()
			}/*,
	
	function(result) {
		$('#message').html(result); // message you want to show
	}*/);
}