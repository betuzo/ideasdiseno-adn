
<%@ page import="mx.com.ideasydiseno.adn.Venta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venta.label', default: 'Venta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-venta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-venta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list venta">
			
				<g:if test="${ventaInstance?.id}">
				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="venta.id.label" default="Folio" /></span>
					
						<span class="property-value" aria-labelledby="id-label"><g:fieldValue bean="${ventaInstance}" field="id"/></span>
					
				</li>
				</g:if>

				<g:if test="${ventaInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="venta.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${ventaInstance?.cliente?.id}">${ventaInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.vendedor}">
				<li class="fieldcontain">
					<span id="vendedor-label" class="property-label"><g:message code="venta.vendedor.label" default="Vendedor" /></span>
					
						<span class="property-value" aria-labelledby="vendedor-label"><g:link controller="usuario" action="show" id="${ventaInstance?.vendedor?.id}">${ventaInstance?.vendedor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.fechaVenta}">
				<li class="fieldcontain">
					<span id="fechaVenta-label" class="property-label"><g:message code="venta.fechaVenta.label" default="Fecha Venta" /></span>
					
						<span class="property-value" aria-labelledby="fechaVenta-label"><g:formatDate date="${ventaInstance?.fechaVenta}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.fechaEntrega}">
				<li class="fieldcontain">
					<span id="fechaEntrega-label" class="property-label"><g:message code="venta.fechaEntrega.label" default="Fecha Entrega" /></span>
					
						<span class="property-value" aria-labelledby="fechaEntrega-label"><g:formatDate date="${ventaInstance?.fechaEntrega}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.totalVenta}">
				<li class="fieldcontain">
					<span id="totalVenta-label" class="property-label"><g:message code="venta.totalVenta.label" default="Total Venta" /></span>
					
						<span class="property-value" aria-labelledby="totalVenta-label"><g:fieldValue bean="${ventaInstance}" field="totalVenta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="venta.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${ventaInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="venta.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${ventaInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.pagos}">
				<li class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="venta.pagos.label" default="Pagos" /></span>
					
						<g:each in="${ventaInstance.pagos}" var="p">
						<span class="property-value" aria-labelledby="pagos-label"><g:link controller="pago" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ventaInstance?.productos}">
				<li class="fieldcontain">
					<span id="productos-label" class="property-label"><g:message code="venta.productos.label" default="Productos" /></span>
					
						<g:each in="${ventaInstance.productos}" var="p">
						<span class="property-value" aria-labelledby="productos-label"><g:link controller="detalleVentaProducto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ventaInstance?.id}" />
					<g:link class="edit" action="edit" id="${ventaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
