hexo.extend.helper.register('print_if', function(condition, value) {
	return condition ? value : '';
});