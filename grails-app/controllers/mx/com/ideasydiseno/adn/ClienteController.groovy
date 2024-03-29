package mx.com.ideasydiseno.adn

import org.springframework.dao.DataIntegrityViolationException

import grails.converters.*

class ClienteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [clienteInstanceList: Cliente.list(params), clienteInstanceTotal: Cliente.count()]
    }

    def clienteVenta() {
        def response = [:]
        def html = ''
        response.exito = "1"
        def query = Cliente.where {
            (nombre == params.nombre && apellidoPaterno == params.apellidoPaterno 
               && sexo== params.sexo && telefono == params.telefono)
        }
        def results = query.list(sort:"apellidoPaterno")
        if (results.size() == 0)
        {
            def clienteInstance = new Cliente(params)
            if (!clienteInstance.save(flush: true)) {
                response.exito = "0"
            }
            response.nuevo = "1"
            response.cliente = clienteInstance
        }else{
            response.nuevo = "0"
            response.cliente = results
        }

        response.html = g.select(optionKey: 'id', 
                        from: response.cliente, 
                        id: 'cliente', 
                        name: 'cliente.id', 
                        class: 'many-to-one', 
                        required: '', 
                        value: response.cliente.id)
        render response as JSON
    }

    def create() {
        [clienteInstance: new Cliente(params)]
    }

    def save() {
        def clienteInstance = new Cliente(params)
        if (!clienteInstance.save(flush: true)) {
            render(view: "create", model: [clienteInstance: clienteInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
        redirect(action: "show", id: clienteInstance.id)
    }

    def show() {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
            return
        }

        [clienteInstance: clienteInstance]
    }

    def edit() {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
            return
        }

        [clienteInstance: clienteInstance]
    }

    def update() {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (clienteInstance.version > version) {
                clienteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cliente.label', default: 'Cliente')] as Object[],
                          "Another user has updated this Cliente while you were editing")
                render(view: "edit", model: [clienteInstance: clienteInstance])
                return
            }
        }

        clienteInstance.properties = params

        if (!clienteInstance.save(flush: true)) {
            render(view: "edit", model: [clienteInstance: clienteInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'cliente.label', default: 'Cliente'), clienteInstance.id])
        redirect(action: "show", id: clienteInstance.id)
    }

    def delete() {
        def clienteInstance = Cliente.get(params.id)
        if (!clienteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
            return
        }

        try {
            clienteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
