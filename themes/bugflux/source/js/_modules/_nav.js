$(function() {

	const animTime = 300;
	var nav = $('.nav-links .menu');

	$('.nav-links > .icon-menu').click(function() {
		nav.slideToggle(animTime);
	});

	$(document).click(function(e) {
		if($(e.target).closest('.nav-links').length == 0) {
			nav.slideUp(animTime);
		}
	});

});