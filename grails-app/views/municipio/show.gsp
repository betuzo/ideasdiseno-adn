
<%@ page import="mx.com.ideasydiseno.adn.Municipio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'municipio.label', default: 'Municipio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-municipio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-municipio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list municipio">
			
				<g:if test="${municipioInstance?.nombreCorto}">
				<li class="fieldcontain">
					<span id="nombreCorto-label" class="property-label"><g:message code="municipio.nombreCorto.label" default="Nombre Corto" /></span>
					
						<span class="property-value" aria-labelledby="nombreCorto-label"><g:fieldValue bean="${municipioInstance}" field="nombreCorto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municipioInstance?.nombreCompleto}">
				<li class="fieldcontain">
					<span id="nombreCompleto-label" class="property-label"><g:message code="municipio.nombreCompleto.label" default="Nombre Completo" /></span>
					
						<span class="property-value" aria-labelledby="nombreCompleto-label"><g:fieldValue bean="${municipioInstance}" field="nombreCompleto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${municipioInstance?.colonias}">
				<li class="fieldcontain">
					<span id="colonias-label" class="property-label"><g:message code="municipio.colonias.label" default="Colonias" /></span>
					
						<g:each in="${municipioInstance.colonias}" var="c">
						<span class="property-value" aria-labelledby="colonias-label"><g:link controller="colonia" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${municipioInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="municipio.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${municipioInstance?.estado?.id}">${municipioInstance?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${municipioInstance?.id}" />
					<g:link class="edit" action="edit" id="${municipioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
