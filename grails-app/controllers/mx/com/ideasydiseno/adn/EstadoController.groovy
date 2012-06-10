package mx.com.ideasydiseno.adn

import org.springframework.dao.DataIntegrityViolationException

class EstadoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [estadoInstanceList: Estado.list(params), estadoInstanceTotal: Estado.count()]
    }

    def create() {
        [estadoInstance: new Estado(params)]
    }

    def save() {
        def estadoInstance = new Estado(params)
        if (!estadoInstance.save(flush: true)) {
            render(view: "create", model: [estadoInstance: estadoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])
        redirect(action: "show", id: estadoInstance.id)
    }

    def show() {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list")
            return
        }

        [estadoInstance: estadoInstance]
    }

    def edit() {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list")
            return
        }

        [estadoInstance: estadoInstance]
    }

    def update() {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (estadoInstance.version > version) {
                estadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'estado.label', default: 'Estado')] as Object[],
                          "Another user has updated this Estado while you were editing")
                render(view: "edit", model: [estadoInstance: estadoInstance])
                return
            }
        }

        estadoInstance.properties = params

        if (!estadoInstance.save(flush: true)) {
            render(view: "edit", model: [estadoInstance: estadoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance.id])
        redirect(action: "show", id: estadoInstance.id)
    }

    def delete() {
        def estadoInstance = Estado.get(params.id)
        if (!estadoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list")
            return
        }

        try {
            estadoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
