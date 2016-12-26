hexo.extend.helper.register('only_for_versions', function(version, categories) {
	var results = {};

	for(var category in categories) {
		for(var item_key in categories[category]) {
			var item = categories[category][item_key];
			if(item.path.split('/')[1] === version) {
				results[category] = results[category] || [];
				results[category].push(item);
			}
		}
	};

	return results;
});