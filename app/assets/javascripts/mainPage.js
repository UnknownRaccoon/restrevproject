

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

		var top = $(id).offset().top - 400;
		
		$('body,html').animate({scrollTop: top}, 1500);
	});
});
// END CENTER BUTTON

// TOP NAV FONT SIZE
$(document).ready(function() {
	$('.navbar-inverse .navbar-nav li').hover(
		function(){
			$(this).animate({fontSize: 18}, 100);
		}, function(){
			$(this).animate({fontSize: 14}, 100);
		});
})
// END TOP NAV FONT SIZE