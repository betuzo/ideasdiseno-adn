<%@ page import="mx.com.ideasydiseno.adn.Producto" %>



<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${productoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="producto.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${productoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'precioSugerido', 'error')} required">
	<label for="precioSugerido">
		<g:message code="producto.precioSugerido.label" default="Precio Sugerido" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precioSugerido" required="" value="${fieldValue(bean: productoInstance, field: 'precioSugerido')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'esVenta', 'error')} ">
	<label for="esVenta">
		<g:message code="producto.esVenta.label" default="Es Venta" />
		
	</label>
	<g:checkBox name="esVenta" value="${productoInstance?.esVenta}" />
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'proveedores', 'error')} ">
	<label for="proveedores">
		<g:message code="producto.proveedores.label" default="Proveedores" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productoInstance?.proveedores?}" var="p">
    <li><g:link controller="productoProveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productoProveedor" action="create" params="['producto.id': productoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor')])}</g:link>
</li>
</ul>

</div>

