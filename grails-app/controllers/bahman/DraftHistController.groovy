package bahman

import org.springframework.dao.DataIntegrityViolationException

class DraftHistController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [draftHistInstanceList: DraftHist.list(params), draftHistInstanceTotal: DraftHist.count()]
    }

    def create() {
        [draftHistInstance: new DraftHist(params)]
    }

    def save() {
        def draftHistInstance = new DraftHist(params)
        if (!draftHistInstance.save(flush: true)) {
            render(view: "create", model: [draftHistInstance: draftHistInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'draftHist.label', default: 'DraftHist'), draftHistInstance.id])
        redirect(action: "show", id: draftHistInstance.id)
    }

    def show() {
        def draftHistInstance = DraftHist.get(params.id)
        if (!draftHistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'draftHist.label', default: 'DraftHist'), params.id])
            redirect(action: "list")
            return
        }

        [draftHistInstance: draftHistInstance]
    }

    def edit() {
        def draftHistInstance = DraftHist.get(params.id)
        if (!draftHistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'draftHist.label', default: 'DraftHist'), params.id])
            redirect(action: "list")
            return
        }

        [draftHistInstance: draftHistInstance]
    }

    def update() {
        def draftHistInstance = DraftHist.get(params.id)
        if (!draftHistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'draftHist.label', default: 'DraftHist'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (draftHistInstance.version > version) {
                draftHistInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'draftHist.label', default: 'DraftHist')] as Object[],
                        "Another user has updated this DraftHist while you were editing")
                render(view: "edit", model: [draftHistInstance: draftHistInstance])
                return
            }
        }

        draftHistInstance.properties = params

        if (!draftHistInstance.save(flush: true)) {
            render(view: "edit", model: [draftHistInstance: draftHistInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'draftHist.label', default: 'DraftHist'), draftHistInstance.id])
        redirect(action: "show", id: draftHistInstance.id)
    }

    def delete() {
        def draftHistInstance = DraftHist.get(params.id)
        if (!draftHistInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'draftHist.label', default: 'DraftHist'), params.id])
            redirect(action: "list")
            return
        }

        try {
            draftHistInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'draftHist.label', default: 'DraftHist'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'draftHist.label', default: 'DraftHist'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
