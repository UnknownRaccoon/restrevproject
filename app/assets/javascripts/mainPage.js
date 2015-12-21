
$(document).ready(function() {

// ******************** TOP NAV ********************
	var h = $(window).height();
	var w = $(window).width();
	$(window).scroll(function(){
		if ( $(this).scrollTop() >= 15) {
				$('.navbar-inverse').addClass('fixed');
			} else if ($(this).scrollTop() < 15) {
				$('.navbar-inverse').removeClass('fixed');
			};
	});
//******************** END TOP NAV ********************

//***************** CENTER BUTTON ********************

	$("#dowm").click(function (event) {
		event.preventDefault();

		var id  = $(this).attr('href');

		var top = $(id).offset().top - 40;
		
		$('body,html').animate({scrollTop: top}, 1500);
	});

//***************** END CENTER BUTTON ********************


//***************** SET HEADER BG ********************

	if (w < 900) {
		$('#bgvideo').hide();
		$('#mp-bg').show();
	}
//***************** END SET HEADER BG ********************



});



//*************** SET HEADER BG ON SCROLL******************
$(window).resize(function() {
	var h = $(window).height();
	var w = $(window).width();
	if (w < 900) {
		$('#bgvideo').hide();
		$('#mp-bg').show();
		$('#mp-bg').height(h);
	} else {
		$('#bgvideo').show();
		$('#mp-bg').hide();
	}
})


//************* END SET HEADER BG ON SCROLL****************







