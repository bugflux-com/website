var fs = require('hexo-fs');
var sm = require('sitemap');

hexo.extend.generator.register('sitemap', function(locals) {
	var urls = locals.pages.map(x => x.permalink);

	var hostname = hexo.config.url;
	var sitemap = sm.createSitemap({
		hostname: hostname,
		urls: [
			{ url: '/img/icons/favicon-512.png', changefreq: 'yearly', priority: 0.2 },
			{ url: '/img/icons/logo-512.png', changefreq: 'yearly', priority: 0.4 },
		]
	});

	urls.forEach(function(url) {
		var priority = 0.5;
		var changefreg = 'yearly';

		if(url.startsWith(hostname +'/api/')) {
			changefreg = 'monthly';
			priority = 0.6;
		}
		
		if(url.startsWith(hostname + '/guide/')) {
			changefreg = 'weekly';
			priority = 0.9;
		}

		sitemap.add({
			url: url,
			changefreg: changefreg,
			priority: priority
		});
	});

	return {
		path: 'sitemap.xml',
		data: sitemap.toString()
	};
});