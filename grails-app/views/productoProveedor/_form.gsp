<%@ page import="mx.com.ideasydiseno.adn.ProductoProveedor" %>



<div class="fieldcontain ${hasErrors(bean: productoProveedorInstance, field: 'producto', 'error')} ">
	<label for="producto">
		<g:message code="productoProveedor.producto.label" default="Producto" />
		
	</label>
	<g:select id="producto" name="producto.id" from="${mx.com.ideasydiseno.adn.Producto.list()}" optionKey="id" value="${productoProveedorInstance?.producto?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoProveedorInstance, field: 'proveedor', 'error')} ">
	<label for="proveedor">
		<g:message code="productoProveedor.proveedor.label" default="Proveedor" />
		
	</label>
	<g:select id="proveedor" name="proveedor.id" from="${mx.com.ideasydiseno.adn.Proveedor.list()}" optionKey="id" value="${productoProveedorInstance?.proveedor?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoProveedorInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="productoProveedor.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precio" required="" value="${fieldValue(bean: productoProveedorInstance, field: 'precio')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoProveedorInstance, field: 'ventajas', 'error')} ">
	<label for="ventajas">
		<g:message code="productoProveedor.ventajas.label" default="Ventajas" />
		
	</label>
	<g:textArea name="ventajas" cols="40" rows="5" maxlength="1000" value="${productoProveedorInstance?.ventajas}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoProveedorInstance, field: 'desventajas', 'error')} ">
	<label for="desventajas">
		<g:message code="productoProveedor.desventajas.label" default="Desventajas" />
		
	</label>
	<g:textArea name="desventajas" cols="40" rows="5" maxlength="1000" value="${productoProveedorInstance?.desventajas}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoProveedorInstance, field: 'esProveedorOficial', 'error')} ">
	<label for="esProveedorOficial">
		<g:message code="productoProveedor.esProveedorOficial.label" default="Es Proveedor Oficial" />
		
	</label>
	<g:checkBox name="esProveedorOficial" value="${productoProveedorInstance?.esProveedorOficial}" />
</div>

