hexo.extend.helper.register('path_for_first', function(pages, category, version = 'master') {
	var allInCategory = pages.find({ layout: category }).sort('order');
	for(var category in allInCategory) {
		var v = category.path.split('/')[1];
		if(v === version) {
			return category.path;
		}
	}

	return allInCategory.data[0].path;
});