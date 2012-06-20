package mx.com.ideasydiseno.adn

import org.springframework.dao.DataIntegrityViolationException

class VentaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ventaInstanceList: Venta.list(params), ventaInstanceTotal: Venta.count()]
    }

    def create() {
        [ventaInstance: new Venta(params), clienteInstance: new Cliente(params)]
    }

    def save() {
        def ventaInstance = new Venta(params)
        if (!ventaInstance.save(flush: true)) {
            render(view: "create", model: [ventaInstance: ventaInstance])
            return
        }

        def pagoInstance = new Pago()
        pagoInstance.venta = ventaInstance
        pagoInstance.concepto = 'Anticipo'
        pagoInstance.totalPago = params.anticipo.toDouble() 
        pagoInstance.fechaPago = new Date()

        if (!pagoInstance.save(flush: true)) {
            flash.message = message(code: 'default.paidfail.message', args: [ventaInstance.id, params.anticipo])
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'venta.label', default: 'Venta'), ventaInstance.id])
        redirect(action: "show", id: ventaInstance.id)
    }

    def show() {
        def ventaInstance = Venta.get(params.id)
        if (!ventaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'venta.label', default: 'Venta'), params.id])
            redirect(action: "list")
            return
        }

        [ventaInstance: ventaInstance]
    }

    def edit() {
        def ventaInstance = Venta.get(params.id)
        if (!ventaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venta.label', default: 'Venta'), params.id])
            redirect(action: "list")
            return
        }

        [ventaInstance: ventaInstance]
    }

    def update() {
        def ventaInstance = Venta.get(params.id)
        if (!ventaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venta.label', default: 'Venta'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ventaInstance.version > version) {
                ventaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'venta.label', default: 'Venta')] as Object[],
                          "Another user has updated this Venta while you were editing")
                render(view: "edit", model: [ventaInstance: ventaInstance])
                return
            }
        }

        ventaInstance.properties = params

        if (!ventaInstance.save(flush: true)) {
            render(view: "edit", model: [ventaInstance: ventaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'venta.label', default: 'Venta'), ventaInstance.id])
        redirect(action: "show", id: ventaInstance.id)
    }

    def delete() {
        def ventaInstance = Venta.get(params.id)
        if (!ventaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'venta.label', default: 'Venta'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ventaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'venta.label', default: 'Venta'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'venta.label', default: 'Venta'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
