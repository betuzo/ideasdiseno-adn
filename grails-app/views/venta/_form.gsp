<%@ page import="mx.com.ideasydiseno.adn.Venta" %>



<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="venta.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${mx.com.ideasydiseno.adn.Cliente.list()}" optionKey="id" required="" value="${ventaInstance?.cliente?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'vendedor', 'error')} required">
	<label for="vendedor">
		<g:message code="venta.vendedor.label" default="Vendedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendedor" name="vendedor.id" from="${mx.com.ideasydiseno.adn.Usuario.list()}" optionKey="id" required="" value="${ventaInstance?.vendedor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'fechaVenta', 'error')} required">
	<label for="fechaVenta">
		<g:message code="venta.fechaVenta.label" default="Fecha Venta" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaVenta" precision="day"  value="${ventaInstance?.fechaVenta}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'fechaEntrega', 'error')} required">
	<label for="fechaEntrega">
		<g:message code="venta.fechaEntrega.label" default="Fecha Entrega" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaEntrega" precision="day"  value="${ventaInstance?.fechaEntrega}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'totalVenta', 'error')} required">
	<label for="totalVenta">
		<g:message code="venta.totalVenta.label" default="Total Venta" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalVenta" required="" value="${fieldValue(bean: ventaInstance, field: 'totalVenta')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="venta.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estado" from="${ventaInstance.constraints.estado.inList}" required="" value="${ventaInstance?.estado}" valueMessagePrefix="venta.estado"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'observaciones', 'error')} required">
	<label for="observaciones">
		<g:message code="venta.observaciones.label" default="Observaciones" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="observaciones" maxlength="50" required="" value="${ventaInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'pagos', 'error')} ">
	<label for="pagos">
		<g:message code="venta.pagos.label" default="Pagos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ventaInstance?.pagos?}" var="p">
    <li><g:link controller="pago" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pago" action="create" params="['venta.id': ventaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pago.label', default: 'Pago')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: ventaInstance, field: 'productos', 'error')} ">
	<label for="productos">
		<g:message code="venta.productos.label" default="Productos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ventaInstance?.productos?}" var="p">
    <li><g:link controller="detalleVentaProducto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="detalleVentaProducto" action="create" params="['venta.id': ventaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto')])}</g:link>
</li>
</ul>

</div>

