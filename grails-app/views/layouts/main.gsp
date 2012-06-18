<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Ideas y Diseño"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="http://www.ideasydiseno.com.mx/"><img src="${resource(dir: 'images', file: 'ideasydiseno_logo.png')}" alt="Grails" width="200" height="150" /></a></div>

		<div id="wrapper">

		<nav id="nav">
			<ul id="navigation">
				<li><g:link class="first" controller='venta' action='create'>Venta</g:link></li>
				<li><a href="#">Services &raquo;</a>
					<ul>
						<li><a href="#">Web Development</a></li>
						<li><a href="#">Logo Design</a></li>
						<li><a href="#">Identity & Branding &raquo;</a>
							<ul>
								<li><a href="#">Business Cards</a></li>
								<li><a href="#">Brochures</a></li>
								<li><a href="#">Envelopes</a></li>
								<li><a href="#">Flyers</a></li>
							</ul>					
						</li>					
						<li><a href="#">Wordpress</a></li>
					</ul>
				</li>
				<li><a href="#">Portfolio &raquo;</a>
					<ul>
						<li><a href="#">Graphic Design</a></li>
						<li><a href="#">Photography</a></li>
						<li><a href="#">Architecture</a></li>
						<li><a href="#">Calligraphy</a></li>
						<li><a href="#">Film &raquo;</a>
							<ul>
								<li><a href="#">John Carter</a></li>
								<li><a href="#">The Avengers</a></li>
								<li><a href="#">The Amazing SpiderMan</a></li>
								<li><a href="#">Madagascar 3</a></li>
							</ul>						
						</li>
						<li><a href="#">Graffity </a></li>
					</ul>				
				</li>
				<li><a href="#">Testimonials</a></li>
				<li><a href="#">Blog</a></li>
				<sec:ifLoggedIn>
					<li><g:link class="last" controller='logout' action='auth'>Salir</g:link></li>
				</sec:ifLoggedIn>
				<sec:ifNotLoggedIn>
					<li><g:link class="last" controller='login' action='auth'>Entrar</g:link></li>
				</sec:ifNotLoggedIn>
			</ul>
		</nav>

		</div>
		<br>

		<g:layoutBody/>
		<div class="footer" role="contentinfo">betuzo</div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>