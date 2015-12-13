// TOP NAV
$(document).ready(function() {
	var h = $(window).height();
	$(window).scroll(function(){
		if ( $(this).scrollTop() >= 15) {
				$('.navbar-inverse').addClass('fixed');
			} else if ($(this).scrollTop() < 15) {
				$('.navbar-inverse').removeClass('fixed');
			};
	});
});
// END TOP NAV

// CENTER BUTTON
$(document).ready(function(){
	$("#dowm").click(function (event) {
		event.preventDefault();

		var id  = $(this).attr('href');

		var top = $(id).offset().top - 40;
		
		$('body,html').animate({scrollTop: top}, 1500);
	});
});
// END CENTER BUTTON

