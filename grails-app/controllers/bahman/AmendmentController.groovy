package bahman

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException


class AmendmentController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {

            def princ = springSecurityService.getPrincipal()
            if (princ instanceof GrailsUser) {
                def user = User.findByUsername(princ.username)
                if (user instanceof Broker ) {
                    if (user.brokerType=="BuyerBroker" ){
                        redirect(action: "buyerList", params: params)
                    }
                    else if (user.brokerType=="DealerBroker"){
                        redirect(action: "dealerList", params:params)
                    }
                }

                else if (user instanceof Customer){
                    redirect(action: "CustomerList", params: params)
                }
                else if(user instanceof Supplier){
                    redirect(action: "SupplierList", params: params)
                }
                else if(user instanceof Manufacturer){
                    redirect(action: "ManufacturerList", params: params)
                }
            }
        }


    def dealerList() {
        def contractInstance= Contract.get(params.id)
        def princ = springSecurityService.getPrincipal()

        def user = User.findByUsername(princ.username)

        [organization: user,contractInstance:contractInstance]

    }

    def create() {
        [amendmentInstance: new Amendment(params)]
    }

    def save() {
        def amendmentInstance = new Amendment(params)
        def conract=Contract.get(params.contractId)
        amendmentInstance.amendmentDate=new Date()
        amendmentInstance.contractNo= conract.contractNo
        amendmentInstance.contractPartNo=conract.contractPartNo
        if (!amendmentInstance.save(flush: true)) {
            render(view: "create", model: [amendmentInstance: amendmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'amendment.label', default: 'Amendment'), amendmentInstance.id])
        redirect(action: "show", id: amendmentInstance.id)
    }

    def show() {
        def amendmentInstance = Amendment.get(params.id)
        if (!amendmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'amendment.label', default: 'Amendment'), params.id])
            redirect(action: "list")
            return
        }

        [amendmentInstance: amendmentInstance]
    }

    def edit() {
        def amendmentInstance = Amendment.get(params.id)
        if (!amendmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'amendment.label', default: 'Amendment'), params.id])
            redirect(action: "list")
            return
        }

        [amendmentInstance: amendmentInstance]
    }

    def update() {
        def amendmentInstance = Amendment.get(params.id)
        if (!amendmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'amendment.label', default: 'Amendment'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (amendmentInstance.version > version) {
                amendmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'amendment.label', default: 'Amendment')] as Object[],
                        "Another user has updated this Amendment while you were editing")
                render(view: "edit", model: [amendmentInstance: amendmentInstance])
                return
            }
        }

        amendmentInstance.properties = params

        if (!amendmentInstance.save(flush: true)) {
            render(view: "edit", model: [amendmentInstance: amendmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'amendment.label', default: 'Amendment'), amendmentInstance.id])
        redirect(action: "show", id: amendmentInstance.id)
    }

    def delete() {
        def amendmentInstance = Amendment.get(params.id)
        if (!amendmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'amendment.label', default: 'Amendment'), params.id])
            redirect(action: "list")
            return
        }

        try {
            amendmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'amendment.label', default: 'Amendment'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'amendment.label', default: 'Amendment'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
