<div class="banner">
	<div class="stack no-gutter" style="height: 350px">
		<div class="item">
			<div class="center">
				<div class="center-box">
					<header class="container">
						<h1 class="mbs"> one place to <b> catch them all </b></h1>
						<p><strong> open source </strong> exception management tool </p>
					</header>
				</div>
			</div>
		</div>
	</div>
</div>

<section style="margin-top: -250px; min-height: 250px;">
	<div class="container">
		<picture style="display: block; text-align: center;">
			<source srcset="img/screenshot.sm.png" media="(max-width: 800px)">
			<img src="img/screenshot.lg.png" alt="Bugflux Applicaiton Screenshot">
		</picture>
	</div>
</section>

<section class="pbx">
	<div class="container">
		<h2 id="What-exactly-is-the-Bugflux"> What exactly is the Bugflux? </h2>

		<div class="grid">
			<div class="item sm-12 lg-4 pts">
				<div class="center">
					<div class="center-box">
						<img src="img/workflow.svg" alt="Bugflux Basic Concept" width="280">
					</div>
				</div>
				<small style="opacity: 0.6;">Icons by <a href="http://webhostingmedia.net">webhostingmedia</a></small>
			</div>
			<div class="item sm-12 lg-8 ptm">
				<p> Bugflux is an <strong>open source project</strong> aiming to help developers in <strong>collecting errors and bugs from their applications</strong>. </p>

				<p> Your application, system or whatever you evolves sends bug report to Bugflux. Then all collected events can be seen and managed by you and your team members via website application. </p>

				<ul>
					<li> Bugflux is <strong>for everyone</strong> - no difference if you are working alone or with your company, there is no limit for team members </li>
					<li> Bugflux is and it will always be <strong>completely free </strong></li>
					<li> Bugflux is <strong>flexible</strong> - it can be used with different servers, with different databases and both on Windows and Linux </li>
					<li> Bugflux is <strong>open source</strong> - you can always add your own features or modify our code </li>
					<li> Bugflux has <strong>fast installers</strong> - configurating lasts only few minutes after which you can use Bugflux locally </li>
				</ul>

				<p><a href="{{ url_for('guide/the-basics/setup.html#Installation-manually') }}"> Installation guide </a> - get your local instance of the Bugflux. </p>
			</div>
		</div>

		{{ page.content }}
	</div>
</section>