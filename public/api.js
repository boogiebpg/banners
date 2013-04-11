$(document).ready(function () {
  $.ajax({
    'url' : 'http://localhost:3000/show_banner/'+ad_place,
    'type' : 'GET',
    'success' : function(data) {
    	$('.place_for_banner').html(data)
    }
  });
});