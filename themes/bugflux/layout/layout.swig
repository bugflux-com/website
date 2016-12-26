<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="application-name" content="{{ config.title }}">
    <link rel="manifest" href="{{ url_for('manifest.json') }}">
    <link rel="icon" sizes="16x16 32x32 48x48" href="{{ url_for('favicon.ico') }}">
    <link rel="icon" sizes="512x512" href="{{ url_for('img/icons/favicon-512.png') }}">

    {# Open graph #}
    <meta property="og:url" content="{{ config.url }}">
    <meta property="og:title" content="{{ page.title or config.title }}">
    <meta property="og:description" content="{{ page.description }}">
    <meta property="og:image" content="{{ url_for('img/icons/favicon-512.png') }}">
    
    {# Base meta #}
    <title>{{ page.title or config.title }}</title>
    <meta name="description" content="{{ page.description }}">
    
    {# Styles #}
    {{ css('css/app') }}

    {# Detect if JS is enabled #}
    <script> document.documentElement.className = document.documentElement.className.replace("no-js", "js"); </script>
</head>
<body>
    {# Page content #}
    <main class="wrapper">
        {{ partial('partials/nav') }}
        {{ body }}

        <div class="push"></div>
    </main>

    {{ partial('partials/footer') }}
    {{ partial('partials/cookies') }}

    {# Scripts #}
    {{ partial('partials/analytics') }}
    {{ js('js/jquery-3.0.0.min') }}
    {{ js('js/app') }}
</body>
</html>