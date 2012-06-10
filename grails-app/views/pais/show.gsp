
<%@ page import="mx.com.ideasydiseno.adn.Pais" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pais.label', default: 'Pais')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pais" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pais" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pais">
			
				<g:if test="${paisInstance?.nombreCorto}">
				<li class="fieldcontain">
					<span id="nombreCorto-label" class="property-label"><g:message code="pais.nombreCorto.label" default="Nombre Corto" /></span>
					
						<span class="property-value" aria-labelledby="nombreCorto-label"><g:fieldValue bean="${paisInstance}" field="nombreCorto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.nombreCompleto}">
				<li class="fieldcontain">
					<span id="nombreCompleto-label" class="property-label"><g:message code="pais.nombreCompleto.label" default="Nombre Completo" /></span>
					
						<span class="property-value" aria-labelledby="nombreCompleto-label"><g:fieldValue bean="${paisInstance}" field="nombreCompleto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${paisInstance?.estados}">
				<li class="fieldcontain">
					<span id="estados-label" class="property-label"><g:message code="pais.estados.label" default="Estados" /></span>
					
						<g:each in="${paisInstance.estados}" var="e">
						<span class="property-value" aria-labelledby="estados-label"><g:link controller="estado" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paisInstance?.id}" />
					<g:link class="edit" action="edit" id="${paisInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
