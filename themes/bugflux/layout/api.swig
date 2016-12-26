<main>
	<div class="container">
		<div class="page">
			<div class="page-nav">
				{% set categories = sort_and_group_by('order', 'category', site.pages.find({ layout: 'api' })) %}
				{% for apis in categories %}
					<section>
						<header>{{ loop.key }}</header>
						{% for api in apis %}
							<a href="{{ url_for(api.path) }}" class="break-all {{ print_if(is_current(api.path), 'active') }}">
								<span class="rest {{ api.method }}">{{ api.method }}</span> {{ api.url }}
							</a>
						{% endfor %}
					</section>
				{% endfor %}
			</div>
			<div class="page-box">
				<div class="markdown">
					<h1 class="page-toggle">
						<div class="chain">
							<div class="item"> {{ page.title }} </div>
							<div class="item no-grow icon-dropdown"> &#x25BE;</div>
						</div>
					</h1>

					{% if page.method and page.full_url %}
						<table class="highlight">
							<tr><th><span class="rest {{ page.method }}">{{ page.method }}</span> {{ page.full_url }} </th></tr>
						</table>
					{% endif %}

					{{ page.content }}
				</div>
			</div>
		</div>
	</div>
</main>