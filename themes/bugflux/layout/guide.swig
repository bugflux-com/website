<main>
	<div class="container">
		<div class="page">
			<div class="page-nav">
				<!-- Versions -->
				{% set versions = {
					'master': '/guide/master/getting-started/overview.html',
				} %}
				
				<section>
					<select id="version">
						{% for versionPath in versions %}
							<option value="{{ versionPath }}" {% if path.split('/')[1] === loop.key %} selected="selected" {% endif %}>
								{{ loop.key }}
							</option>
						{% endfor %}
					</select>
				</section>

				<!-- Sections -->
				{% set categories = sort_and_group_by('order', 'category', site.pages.find({ layout: 'guide' })) %}
				{% set categories = only_for_versions(path.split('/')[1], categories) %}
				{% for guides in categories %}
					<section>
						<header>{{ loop.key }}</header>
						{% for guide in guides %}
							<a href="{{ url_for(guide.path) }}" class="{{ print_if(is_current(guide.path), 'active') }}">{{ guide.title }}</a>
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
					
					{{ page.content }}
				</div>
			</div>
		</div>
	</div>
</main>