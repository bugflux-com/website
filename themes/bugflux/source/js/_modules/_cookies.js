$(function() {

	var showDelay = 600;
	var showDuration = 400;
	var cookieKey = 'cookie_policy';
	var isAccepted = document.cookie.indexOf(cookieKey) >= 0;

	if(!isAccepted) {
		$('.cookies').delay(showDelay)
			.fadeIn(showDuration);

		$('.cookies').click(function() {
			expires = new Date();
			expires.setTime(expires.getTime() + 365*24*60*60*1000);
			document.cookie = cookieKey +'='+ 'accepted' +';expires='+ expires;
			$(this).fadeOut(showDuration/2);
		});
	}

});