function saveFunction() {
	var x = document.getElementById("saved_sucessfull");
	x.className = "show";
	setTimeout(function() {
		x.className = x.className.replace("show", "");
	}, 3000);
}

function deleteFunction() {
	var x = document.getElementById("deleted_sucessfull");
	x.className = "show";
	setTimeout(function() {
		x.className = x.className.replace("show", "");
	}, 3000);
}

