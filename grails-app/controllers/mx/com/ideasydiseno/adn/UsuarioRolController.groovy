package mx.com.ideasydiseno.adn

import org.springframework.dao.DataIntegrityViolationException

class UsuarioRolController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioRolInstanceList: UsuarioRol.list(params), usuarioRolInstanceTotal: UsuarioRol.count()]
    }

    def create() {
        [usuarioRolInstance: new UsuarioRol(params)]
    }

    def save() {
        def usuarioRolInstance = new UsuarioRol(params)
        if (!usuarioRolInstance.save(flush: true)) {
            render(view: "create", model: [usuarioRolInstance: usuarioRolInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), usuarioRolInstance.id])
        redirect(action: "show", id: usuarioRolInstance.id)
    }

    def show() {
        def usuarioRolInstance = UsuarioRol.get(params.id)
        if (!usuarioRolInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), params.id])
            redirect(action: "list")
            return
        }

        [usuarioRolInstance: usuarioRolInstance]
    }

    def edit() {
        def usuarioRolInstance = UsuarioRol.get(params.id)
        if (!usuarioRolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), params.id])
            redirect(action: "list")
            return
        }

        [usuarioRolInstance: usuarioRolInstance]
    }

    def update() {
        def usuarioRolInstance = UsuarioRol.get(params.id)
        if (!usuarioRolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (usuarioRolInstance.version > version) {
                usuarioRolInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'usuarioRol.label', default: 'UsuarioRol')] as Object[],
                          "Another user has updated this UsuarioRol while you were editing")
                render(view: "edit", model: [usuarioRolInstance: usuarioRolInstance])
                return
            }
        }

        usuarioRolInstance.properties = params

        if (!usuarioRolInstance.save(flush: true)) {
            render(view: "edit", model: [usuarioRolInstance: usuarioRolInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), usuarioRolInstance.id])
        redirect(action: "show", id: usuarioRolInstance.id)
    }

    def delete() {
        def usuarioRolInstance = UsuarioRol.get(params.id)
        if (!usuarioRolInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), params.id])
            redirect(action: "list")
            return
        }

        try {
            usuarioRolInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
