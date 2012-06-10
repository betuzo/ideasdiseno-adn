package mx.com.ideasydiseno.adn

import org.springframework.dao.DataIntegrityViolationException

class ProductoProveedorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productoProveedorInstanceList: ProductoProveedor.list(params), productoProveedorInstanceTotal: ProductoProveedor.count()]
    }

    def create() {
        [productoProveedorInstance: new ProductoProveedor(params)]
    }

    def save() {
        def productoProveedorInstance = new ProductoProveedor(params)
        if (!productoProveedorInstance.save(flush: true)) {
            render(view: "create", model: [productoProveedorInstance: productoProveedorInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor'), productoProveedorInstance.id])
        redirect(action: "show", id: productoProveedorInstance.id)
    }

    def show() {
        def productoProveedorInstance = ProductoProveedor.get(params.id)
        if (!productoProveedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        [productoProveedorInstance: productoProveedorInstance]
    }

    def edit() {
        def productoProveedorInstance = ProductoProveedor.get(params.id)
        if (!productoProveedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        [productoProveedorInstance: productoProveedorInstance]
    }

    def update() {
        def productoProveedorInstance = ProductoProveedor.get(params.id)
        if (!productoProveedorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (productoProveedorInstance.version > version) {
                productoProveedorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'productoProveedor.label', default: 'ProductoProveedor')] as Object[],
                          "Another user has updated this ProductoProveedor while you were editing")
                render(view: "edit", model: [productoProveedorInstance: productoProveedorInstance])
                return
            }
        }

        productoProveedorInstance.properties = params

        if (!productoProveedorInstance.save(flush: true)) {
            render(view: "edit", model: [productoProveedorInstance: productoProveedorInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor'), productoProveedorInstance.id])
        redirect(action: "show", id: productoProveedorInstance.id)
    }

    def delete() {
        def productoProveedorInstance = ProductoProveedor.get(params.id)
        if (!productoProveedorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor'), params.id])
            redirect(action: "list")
            return
        }

        try {
            productoProveedorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productoProveedor.label', default: 'ProductoProveedor'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
