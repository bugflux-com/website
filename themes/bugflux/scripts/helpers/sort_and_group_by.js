hexo.extend.helper.register('sort_and_group_by', function(sort_by, group_by, array) {
	var arr = array.sort(sort_by);
	var results = {};

	(arr.data || arr).forEach(function(item) {
		if(item[sort_by]) { // skip files without sort_by key
			results[item[group_by]] = results[item[group_by]] || []; // initialize group at first occurence
			results[item[group_by]].push(item); // add item to group
		}
	});

	return results;
});