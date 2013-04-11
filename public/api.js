$(document).ready(function () {

	$.fn.MyGet = function(id) {
	  	$.ajax({
		    'url' : 'http://localhost:3000/show_banner/'+id,
		    'type' : 'GET',
		    'success' : function(data) {
		    	$('#'+id).html(data)
		    }
	 	});
 	}

	var postText = "";
		$("div.place_for_banner").each(function() {
    	$.fn.MyGet($(this).attr("id"));
	});

});