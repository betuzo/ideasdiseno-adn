<%@ page import="mx.com.ideasydiseno.adn.DetalleEntradaProducto" %>



<div class="fieldcontain ${hasErrors(bean: detalleEntradaProductoInstance, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="detalleEntradaProducto.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${mx.com.ideasydiseno.adn.Producto.list()}" optionKey="id" required="" value="${detalleEntradaProductoInstance?.producto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleEntradaProductoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="detalleEntradaProducto.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cantidad" required="" value="${fieldValue(bean: detalleEntradaProductoInstance, field: 'cantidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleEntradaProductoInstance, field: 'totalProducto', 'error')} required">
	<label for="totalProducto">
		<g:message code="detalleEntradaProducto.totalProducto.label" default="Total Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalProducto" required="" value="${fieldValue(bean: detalleEntradaProductoInstance, field: 'totalProducto')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleEntradaProductoInstance, field: 'entrada', 'error')} required">
	<label for="entrada">
		<g:message code="detalleEntradaProducto.entrada.label" default="Entrada" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entrada" name="entrada.id" from="${mx.com.ideasydiseno.adn.Entrada.list()}" optionKey="id" required="" value="${detalleEntradaProductoInstance?.entrada?.id}" class="many-to-one"/>
</div>

