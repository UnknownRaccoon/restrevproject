
// VIDEO
$( document ).ready(function() {

	scaleVideoContainer();

	initBannerVideoSize('.video-container .poster img');
	initBannerVideoSize('.video-container .filter');
	initBannerVideoSize('.video-container video');

	$(window).on('resize', function() {
		scaleVideoContainer();
		scaleBannerVideoSize('.video-container .poster img');
		scaleBannerVideoSize('.video-container .filter');
		scaleBannerVideoSize('.video-container video');
	});

});

function scaleVideoContainer() {

	var height = $(window).height() + 5;
	var unitHeight = parseInt(height) + 'px';
	$('.homepage-hero-module').css('height',unitHeight);

}

function initBannerVideoSize(element){

	$(element).each(function(){
		$(this).data('height', $(this).height());
		$(this).data('width', $(this).width());
	});

	scaleBannerVideoSize(element);

}

function scaleBannerVideoSize(element){

	var windowWidth = $(window).width(),
	windowHeight = $(window).height() + 5,
	videoWidth,
	videoHeight;


	$(element).each(function(){
		var videoAspectRatio = $(this).data('height')/$(this).data('width');

		$(this).width(windowWidth);

		if(windowWidth < 1000){
			videoHeight = windowHeight;
			videoWidth = videoHeight / videoAspectRatio;
			$(this).css({'margin-top' : 0, 'margin-left' : -(videoWidth - windowWidth) / 2 + 'px'});

			$(this).width(videoWidth).height(videoHeight);
		}

		$('.homepage-hero-module .video-container video').addClass('fadeIn animated');

	});
} // END VIDEO

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

		var id  = $(this).attr('href'),

			top = $(id).offset().top - 40;
		
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
