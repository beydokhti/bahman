package bahman

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class PhaseController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [phaseInstanceList: Phase.list(params), phaseInstanceTotal: Phase.count()]
    }

    def create() {
        [phaseInstance: new Phase(params)]
    }

    def save() {
        def prevPhase = Phase.get(params.phaseId)
        prevPhase.status=params.status
        prevPhase.endDate= new Date()
        def phaseInstance = new Phase(params)

        phaseInstance.startDate=new Date()
        if (prevPhase.phase=="BuyerBroker" && params.status=="O")  {
            phaseInstance.phase="Supplier"
         }
        else if(prevPhase.phase=="Supplier" && params.status=="O") {
            phaseInstance.phase="Manufacturer"
        }
        else if(prevPhase.phase=="Manufacturer" && params.status=="O") {
            phaseInstance.phase="Finished"
        }
        else if(prevPhase.phase=="Manufacturer" && params.status=="R") {
            phaseInstance.phase="Supplier"
        }
        else if(prevPhase.phase=="Supplier" && params.status=="R") {
            phaseInstance.phase="BuyerBroker"
        }
        else if(prevPhase.phase=="BuyerBroker" && params.status=="R") {
            phaseInstance.phase="DealerBroker"
        }
        if (phaseInstance.phase=="Finished"){
            phaseInstance.status="O"
        }else{
            phaseInstance.status="W"
        }
        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            def org
            if (user instanceof Broker || user instanceof Supplier ||user instanceof Manufacturer ){
                phaseInstance.organization=user
            }

        }
        prevPhase.save()
        if (!phaseInstance.save(flush: true)) {
//            render(view: "create", model: [phaseInstance: phaseInstance])
            return
        }
        def contract = Contract.get(params.contractId)
        contract.addToPhases(phaseInstance)
        if (contract.save()){
            render phaseInstance.id
        }
        render(view: "show",controllerName:"contract", model: [id:contract.id])
    }

    def show() {
        def phaseInstance = Phase.get(params.id)
        if (!phaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phase.label', default: 'Phase'), params.id])
            redirect(action: "list")
            return
        }

        [phaseInstance: phaseInstance]
    }

    def edit() {
        def phaseInstance = Phase.get(params.id)
        if (!phaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phase.label', default: 'Phase'), params.id])
            redirect(action: "list")
            return
        }

        [phaseInstance: phaseInstance]
    }

    def update() {
        def phaseInstance = Phase.get(params.id)
        if (!phaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phase.label', default: 'Phase'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (phaseInstance.version > version) {
                phaseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'phase.label', default: 'Phase')] as Object[],
                        "Another user has updated this Phase while you were editing")
                render(view: "edit", model: [phaseInstance: phaseInstance])
                return
            }
        }

        phaseInstance.properties = params

        if (!phaseInstance.save(flush: true)) {
            render(view: "edit", model: [phaseInstance: phaseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'phase.label', default: 'Phase'), phaseInstance.id])
        redirect(action: "show", id: phaseInstance.id)
    }

    def delete() {
        def phaseInstance = Phase.get(params.id)
        if (!phaseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phase.label', default: 'Phase'), params.id])
            redirect(action: "list")
            return
        }

        try {
            phaseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'phase.label', default: 'Phase'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'phase.label', default: 'Phase'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    def form() {
        def phaseInstance = new Phase()
        render(template: 'form', model: [phaseInstance: phaseInstance])
    }
}
