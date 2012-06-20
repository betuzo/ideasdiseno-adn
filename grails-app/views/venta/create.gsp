<%@ page import="mx.com.ideasydiseno.adn.Venta" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'venta.label', default: 'Venta')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript>
		function overlay() {
			el = document.getElementById("overlay");
			el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
		}
		function responseClienteVenta(response) {      
			if (response.exito == '1'){
				$("#cliente").html(response.html);
			}else{
				alert('Problema al buscar Cliente... favor de reportarlo');
			}
			overlay();
		}
		</g:javascript>
	</head>
	<body>
		<a href="#create-venta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-venta" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${ventaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${ventaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div id="overlay">
				<div id="overlaycontent">
				  <p>
				  <g:formRemote name="from_form" url="[controller:'cliente', action:'clienteVenta']"
              onSuccess="responseClienteVenta(data)">
					<fieldset class="form">
						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} required">
							<label for="nombre">
								<g:message code="cliente.nombre.label" default="Nombre" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="nombre" required="" value="${clienteInstance?.nombre}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'apellidoPaterno', 'error')} required">
							<label for="apellidoPaterno">
								<g:message code="cliente.apellidoPaterno.label" default="Apellido Paterno" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="apellidoPaterno" required="" value="${clienteInstance?.apellidoPaterno}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'apellidoMaterno', 'error')} ">
							<label for="apellidoMaterno">
								<g:message code="cliente.apellidoMaterno.label" default="Apellido Materno" />
								
							</label>
							<g:textField name="apellidoMaterno" value="${clienteInstance?.apellidoMaterno}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefono', 'error')} required">
							<label for="telefono">
								<g:message code="cliente.telefono.label" default="Telefono" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="telefono" required="" value="${clienteInstance?.telefono}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'sexo', 'error')} required">
							<label for="sexo">
								<g:message code="cliente.sexo.label" default="Sexo" />
								<span class="required-indicator">*</span>
							</label>
							<g:select name="sexo" from="${clienteInstance.constraints.sexo.inList}" required="" value="${clienteInstance?.sexo}" valueMessagePrefix="cliente.sexo"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'fechaNacimiento', 'error')} ">
							<label for="fechaNacimiento">
								<g:message code="cliente.fechaNacimiento.label" default="Fecha Nacimiento" />
								
							</label>
							<g:datePicker name="fechaNacimiento" precision="day"  value="${clienteInstance?.fechaNacimiento}" default="none" noSelection="['': '']" />
						</div>

						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'direccion', 'error')} ">
							<label for="direccion">
								<g:message code="cliente.direccion.label" default="Direccion" />
								
							</label>
							<g:textField name="direccion" value="${clienteInstance?.direccion}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'colonia', 'error')} ">
							<label for="colonia">
								<g:message code="cliente.colonia.label" default="Colonia" />
								
							</label>
							<g:select id="colonia" name="colonia.id" from="${mx.com.ideasydiseno.adn.Colonia.list()}" optionKey="id" value="${clienteInstance?.colonia?.id}" class="many-to-one" noSelection="['null': '']"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'codigoPostal', 'error')} ">
							<label for="codigoPostal">
								<g:message code="cliente.codigoPostal.label" default="Codigo Postal" />
								
							</label>
							<g:textField name="codigoPostal" value="${clienteInstance?.codigoPostal}"/>
						</div>

						<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
							<label for="email">
								<g:message code="cliente.email.label" default="Email" />
								
							</label>
							<g:field type="email" name="email" value="${clienteInstance?.email}"/>
						</div>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="ready" value="${message(code: 'default.button.ready.label', default: 'Listo')}" />
						<input type="button" class="close" value="Cerrar" onclick="overlay()" />
					</fieldset>
					</g:formRemote>
				  </p>
				</div>
			</div>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					<input type="button" class="search" value="Buscar Cliente" onclick="overlay()" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
