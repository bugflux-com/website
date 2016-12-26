hexo.extend.helper.register('path_for_first', function(pages, category) {
	var allInCategory = pages.find({ layout: category });
	return allInCategory.sort('order').data[0].path;
});