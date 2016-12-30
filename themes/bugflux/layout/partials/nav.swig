<div class="nav">
	<div class="container">
		<div class="chain">
			<div class="item no-grow">
				<div class="nav-brand">
					<a href="{{ url_for('/') }}" class="active"><strong> bugflux </strong></a>
					{% if page.layout != 'page' %}
						| <span>{{ theme.layout_title[page.layout] }}</span>
					{% endif %}
				</div>
			</div>
			<div class="item">
				<div class="nav-links">
					<i class="icon-menu"></i>
					<nav class="menu">
						<a href="{{ url_for(path_for_first(site.pages, 'guide', '1.0')) }}" class="{{ print_if(path.startsWith("guide"), 'active') }}"> Guide </a>
						<a href="{{ url_for(path_for_first(site.pages, 'api')) }}" class="{{ print_if(path.startsWith("api"), 'active') }}"> API </a>
						<a class="inacessible"> Blog </a>
						<a class="inacessible"> Forum </a>
						<a href="https://github.com/bugflux-com"> GitHub </a>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>