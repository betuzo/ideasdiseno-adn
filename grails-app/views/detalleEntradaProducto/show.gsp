
<%@ page import="mx.com.ideasydiseno.adn.DetalleEntradaProducto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleEntradaProducto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleEntradaProducto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleEntradaProducto">
			
				<g:if test="${detalleEntradaProductoInstance?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="detalleEntradaProducto.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="producto" action="show" id="${detalleEntradaProductoInstance?.producto?.id}">${detalleEntradaProductoInstance?.producto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleEntradaProductoInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="detalleEntradaProducto.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${detalleEntradaProductoInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleEntradaProductoInstance?.totalProducto}">
				<li class="fieldcontain">
					<span id="totalProducto-label" class="property-label"><g:message code="detalleEntradaProducto.totalProducto.label" default="Total Producto" /></span>
					
						<span class="property-value" aria-labelledby="totalProducto-label"><g:fieldValue bean="${detalleEntradaProductoInstance}" field="totalProducto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleEntradaProductoInstance?.entrada}">
				<li class="fieldcontain">
					<span id="entrada-label" class="property-label"><g:message code="detalleEntradaProducto.entrada.label" default="Entrada" /></span>
					
						<span class="property-value" aria-labelledby="entrada-label"><g:link controller="entrada" action="show" id="${detalleEntradaProductoInstance?.entrada?.id}">${detalleEntradaProductoInstance?.entrada?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${detalleEntradaProductoInstance?.id}" />
					<g:link class="edit" action="edit" id="${detalleEntradaProductoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
