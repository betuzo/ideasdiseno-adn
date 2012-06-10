
<%@ page import="mx.com.ideasydiseno.adn.Pago" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pago.label', default: 'Pago')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pago" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pago" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pago">
			
				<g:if test="${pagoInstance?.venta}">
				<li class="fieldcontain">
					<span id="venta-label" class="property-label"><g:message code="pago.venta.label" default="Venta" /></span>
					
						<span class="property-value" aria-labelledby="venta-label"><g:link controller="venta" action="show" id="${pagoInstance?.venta?.id}">${pagoInstance?.venta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoInstance?.concepto}">
				<li class="fieldcontain">
					<span id="concepto-label" class="property-label"><g:message code="pago.concepto.label" default="Concepto" /></span>
					
						<span class="property-value" aria-labelledby="concepto-label"><g:fieldValue bean="${pagoInstance}" field="concepto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoInstance?.totalPago}">
				<li class="fieldcontain">
					<span id="totalPago-label" class="property-label"><g:message code="pago.totalPago.label" default="Total Pago" /></span>
					
						<span class="property-value" aria-labelledby="totalPago-label"><g:fieldValue bean="${pagoInstance}" field="totalPago"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagoInstance?.fechaPago}">
				<li class="fieldcontain">
					<span id="fechaPago-label" class="property-label"><g:message code="pago.fechaPago.label" default="Fecha Pago" /></span>
					
						<span class="property-value" aria-labelledby="fechaPago-label"><g:formatDate date="${pagoInstance?.fechaPago}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pagoInstance?.id}" />
					<g:link class="edit" action="edit" id="${pagoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
