package mx.com.ideasydiseno.adn

import org.springframework.dao.DataIntegrityViolationException

class MunicipioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [municipioInstanceList: Municipio.list(params), municipioInstanceTotal: Municipio.count()]
    }

    def create() {
        [municipioInstance: new Municipio(params)]
    }

    def save() {
        def municipioInstance = new Municipio(params)
        if (!municipioInstance.save(flush: true)) {
            render(view: "create", model: [municipioInstance: municipioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'municipio.label', default: 'Municipio'), municipioInstance.id])
        redirect(action: "show", id: municipioInstance.id)
    }

    def show() {
        def municipioInstance = Municipio.get(params.id)
        if (!municipioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list")
            return
        }

        [municipioInstance: municipioInstance]
    }

    def edit() {
        def municipioInstance = Municipio.get(params.id)
        if (!municipioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list")
            return
        }

        [municipioInstance: municipioInstance]
    }

    def update() {
        def municipioInstance = Municipio.get(params.id)
        if (!municipioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (municipioInstance.version > version) {
                municipioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'municipio.label', default: 'Municipio')] as Object[],
                          "Another user has updated this Municipio while you were editing")
                render(view: "edit", model: [municipioInstance: municipioInstance])
                return
            }
        }

        municipioInstance.properties = params

        if (!municipioInstance.save(flush: true)) {
            render(view: "edit", model: [municipioInstance: municipioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'municipio.label', default: 'Municipio'), municipioInstance.id])
        redirect(action: "show", id: municipioInstance.id)
    }

    def delete() {
        def municipioInstance = Municipio.get(params.id)
        if (!municipioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list")
            return
        }

        try {
            municipioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
