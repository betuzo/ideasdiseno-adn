package mx.com.ideasydiseno.adn

import org.springframework.dao.DataIntegrityViolationException

class DetalleVentaProductoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [detalleVentaProductoInstanceList: DetalleVentaProducto.list(params), detalleVentaProductoInstanceTotal: DetalleVentaProducto.count()]
    }

    def create() {
        [detalleVentaProductoInstance: new DetalleVentaProducto(params)]
    }

    def save() {
        def detalleVentaProductoInstance = new DetalleVentaProducto(params)
        if (!detalleVentaProductoInstance.save(flush: true)) {
            render(view: "create", model: [detalleVentaProductoInstance: detalleVentaProductoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto'), detalleVentaProductoInstance.id])
        redirect(action: "show", id: detalleVentaProductoInstance.id)
    }

    def show() {
        def detalleVentaProductoInstance = DetalleVentaProducto.get(params.id)
        if (!detalleVentaProductoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto'), params.id])
            redirect(action: "list")
            return
        }

        [detalleVentaProductoInstance: detalleVentaProductoInstance]
    }

    def edit() {
        def detalleVentaProductoInstance = DetalleVentaProducto.get(params.id)
        if (!detalleVentaProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto'), params.id])
            redirect(action: "list")
            return
        }

        [detalleVentaProductoInstance: detalleVentaProductoInstance]
    }

    def update() {
        def detalleVentaProductoInstance = DetalleVentaProducto.get(params.id)
        if (!detalleVentaProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (detalleVentaProductoInstance.version > version) {
                detalleVentaProductoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto')] as Object[],
                          "Another user has updated this DetalleVentaProducto while you were editing")
                render(view: "edit", model: [detalleVentaProductoInstance: detalleVentaProductoInstance])
                return
            }
        }

        detalleVentaProductoInstance.properties = params

        if (!detalleVentaProductoInstance.save(flush: true)) {
            render(view: "edit", model: [detalleVentaProductoInstance: detalleVentaProductoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto'), detalleVentaProductoInstance.id])
        redirect(action: "show", id: detalleVentaProductoInstance.id)
    }

    def delete() {
        def detalleVentaProductoInstance = DetalleVentaProducto.get(params.id)
        if (!detalleVentaProductoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            detalleVentaProductoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'detalleVentaProducto.label', default: 'DetalleVentaProducto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
