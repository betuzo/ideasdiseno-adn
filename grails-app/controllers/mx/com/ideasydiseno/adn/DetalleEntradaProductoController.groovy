package mx.com.ideasydiseno.adn

import org.springframework.dao.DataIntegrityViolationException

class DetalleEntradaProductoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [detalleEntradaProductoInstanceList: DetalleEntradaProducto.list(params), detalleEntradaProductoInstanceTotal: DetalleEntradaProducto.count()]
    }

    def create() {
        [detalleEntradaProductoInstance: new DetalleEntradaProducto(params)]
    }

    def save() {
        def detalleEntradaProductoInstance = new DetalleEntradaProducto(params)
        if (!detalleEntradaProductoInstance.save(flush: true)) {
            render(view: "create", model: [detalleEntradaProductoInstance: detalleEntradaProductoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto'), detalleEntradaProductoInstance.id])
        redirect(action: "show", id: detalleEntradaProductoInstance.id)
    }

    def show() {
        def detalleEntradaProductoInstance = DetalleEntradaProducto.get(params.id)
        if (!detalleEntradaProductoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto'), params.id])
            redirect(action: "list")
            return
        }

        [detalleEntradaProductoInstance: detalleEntradaProductoInstance]
    }

    def edit() {
        def detalleEntradaProductoInstance = DetalleEntradaProducto.get(params.id)
        if (!detalleEntradaProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto'), params.id])
            redirect(action: "list")
            return
        }

        [detalleEntradaProductoInstance: detalleEntradaProductoInstance]
    }

    def update() {
        def detalleEntradaProductoInstance = DetalleEntradaProducto.get(params.id)
        if (!detalleEntradaProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (detalleEntradaProductoInstance.version > version) {
                detalleEntradaProductoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto')] as Object[],
                          "Another user has updated this DetalleEntradaProducto while you were editing")
                render(view: "edit", model: [detalleEntradaProductoInstance: detalleEntradaProductoInstance])
                return
            }
        }

        detalleEntradaProductoInstance.properties = params

        if (!detalleEntradaProductoInstance.save(flush: true)) {
            render(view: "edit", model: [detalleEntradaProductoInstance: detalleEntradaProductoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto'), detalleEntradaProductoInstance.id])
        redirect(action: "show", id: detalleEntradaProductoInstance.id)
    }

    def delete() {
        def detalleEntradaProductoInstance = DetalleEntradaProducto.get(params.id)
        if (!detalleEntradaProductoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            detalleEntradaProductoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'detalleEntradaProducto.label', default: 'DetalleEntradaProducto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
