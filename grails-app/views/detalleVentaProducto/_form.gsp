<%@ page import="mx.com.ideasydiseno.adn.DetalleVentaProducto" %>



<div class="fieldcontain ${hasErrors(bean: detalleVentaProductoInstance, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="detalleVentaProducto.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${mx.com.ideasydiseno.adn.Producto.findByEsVenta(true)}" optionKey="id" required="" value="${detalleVentaProductoInstance?.producto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleVentaProductoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="detalleVentaProducto.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cantidad" required="" value="${fieldValue(bean: detalleVentaProductoInstance, field: 'cantidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleVentaProductoInstance, field: 'totalProducto', 'error')} required">
	<label for="totalProducto">
		<g:message code="detalleVentaProducto.totalProducto.label" default="Total Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalProducto" required="" value="${fieldValue(bean: detalleVentaProductoInstance, field: 'totalProducto')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: detalleVentaProductoInstance, field: 'venta', 'error')} required">
	<label for="venta">
		<g:message code="detalleVentaProducto.venta.label" default="Venta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="venta" name="venta.id" from="${mx.com.ideasydiseno.adn.Venta.list()}" optionKey="id" required="" value="${detalleVentaProductoInstance?.venta?.id}" class="many-to-one"/>
</div>

