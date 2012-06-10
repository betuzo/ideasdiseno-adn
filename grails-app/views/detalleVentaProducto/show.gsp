
<%@ page import="mx.com.ideasydiseno.adn.DetalleVentaProducto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detalleVentaProducto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detalleVentaProducto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detalleVentaProducto">
			
				<g:if test="${detalleVentaProductoInstance?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="detalleVentaProducto.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="producto" action="show" id="${detalleVentaProductoInstance?.producto?.id}">${detalleVentaProductoInstance?.producto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleVentaProductoInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="detalleVentaProducto.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${detalleVentaProductoInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleVentaProductoInstance?.totalProducto}">
				<li class="fieldcontain">
					<span id="totalProducto-label" class="property-label"><g:message code="detalleVentaProducto.totalProducto.label" default="Total Producto" /></span>
					
						<span class="property-value" aria-labelledby="totalProducto-label"><g:fieldValue bean="${detalleVentaProductoInstance}" field="totalProducto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detalleVentaProductoInstance?.venta}">
				<li class="fieldcontain">
					<span id="venta-label" class="property-label"><g:message code="detalleVentaProducto.venta.label" default="Venta" /></span>
					
						<span class="property-value" aria-labelledby="venta-label"><g:link controller="venta" action="show" id="${detalleVentaProductoInstance?.venta?.id}">${detalleVentaProductoInstance?.venta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${detalleVentaProductoInstance?.id}" />
					<g:link class="edit" action="edit" id="${detalleVentaProductoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
