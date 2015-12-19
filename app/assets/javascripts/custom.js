// ============= restaurant review text visibility fix ====================

$(document).ready(function() {
	var h = $(window).height();
	var wid = $(window).width();
	if (wid <= 575) {
		$('.res-review').css('padding-bottom', '120px');
	} else {
		$('.res-review').css('padding-bottom', '20px');
	}
});

$(window).scroll(function(){
	if (wid <= 575) {
		$('.res-review').css('padding-bottom', '120px');
	} else {
		$('.res-review').css('padding-bottom', '20px');
	}
});