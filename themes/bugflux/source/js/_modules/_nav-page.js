$(function() {

	const animTime = 300;
	
	var nav = $('.page .page-nav');
	var navToggle = $('.page .page-box .page-toggle');

	navToggle.click(function() {
		nav.slideToggle(animTime);
	});

	$(document).click(function(e) {
		if($(e.target).closest(nav).length == 0 && $(e.target).closest(navToggle).length == 0) {
			nav.slideUp(animTime);
		}
	});

});


