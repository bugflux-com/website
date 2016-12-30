hexo.extend.helper.register('path_for_first', function(pages, category, version = 'master') {
	var allInCategory = pages.find({ layout: category }).sort('order');

	var path = allInCategory.data[0].path;
	allInCategory.some(function(category) {
		var v = category.path.split('/')[1];
		if(v === version) {
			path = category.path;
			return false; // stop searching
		}

		return true; // continue searching
	});

	return allInCategory.data[0].path;
});