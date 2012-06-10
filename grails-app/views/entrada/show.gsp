
<%@ page import="mx.com.ideasydiseno.adn.Entrada" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entrada.label', default: 'Entrada')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-entrada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-entrada" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list entrada">
			
				<g:if test="${entradaInstance?.empleado}">
				<li class="fieldcontain">
					<span id="empleado-label" class="property-label"><g:message code="entrada.empleado.label" default="Empleado" /></span>
					
						<span class="property-value" aria-labelledby="empleado-label"><g:link controller="usuario" action="show" id="${entradaInstance?.empleado?.id}">${entradaInstance?.empleado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.fechaSolicitud}">
				<li class="fieldcontain">
					<span id="fechaSolicitud-label" class="property-label"><g:message code="entrada.fechaSolicitud.label" default="Fecha Solicitud" /></span>
					
						<span class="property-value" aria-labelledby="fechaSolicitud-label"><g:formatDate date="${entradaInstance?.fechaSolicitud}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.totalEntrada}">
				<li class="fieldcontain">
					<span id="totalEntrada-label" class="property-label"><g:message code="entrada.totalEntrada.label" default="Total Entrada" /></span>
					
						<span class="property-value" aria-labelledby="totalEntrada-label"><g:fieldValue bean="${entradaInstance}" field="totalEntrada"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="entrada.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${entradaInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="entrada.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${entradaInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.fechaRecepcion}">
				<li class="fieldcontain">
					<span id="fechaRecepcion-label" class="property-label"><g:message code="entrada.fechaRecepcion.label" default="Fecha Recepcion" /></span>
					
						<span class="property-value" aria-labelledby="fechaRecepcion-label"><g:formatDate date="${entradaInstance?.fechaRecepcion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${entradaInstance?.productos}">
				<li class="fieldcontain">
					<span id="productos-label" class="property-label"><g:message code="entrada.productos.label" default="Productos" /></span>
					
						<g:each in="${entradaInstance.productos}" var="p">
						<span class="property-value" aria-labelledby="productos-label"><g:link controller="detalleEntradaProducto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${entradaInstance?.id}" />
					<g:link class="edit" action="edit" id="${entradaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
