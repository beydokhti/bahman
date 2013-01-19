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
            def amendmentType
            if (user instanceof Broker) {
                if (user.brokerType == "BuyerBroker") {
                    amendmentType = "buyerBroker"
                } else if (user.brokerType == "DealerBroker") {
                    amendmentType = "dealerBroker"
                }
            } else if (user instanceof Customer) {
                amendmentType = "finished"
            } else if (user instanceof Supplier) {
                amendmentType = "supplier"
            } else if (user instanceof Manufacturer) {
                amendmentType = "manufacturer"
            }

            def contractInstance = Contract.get(params.id)

            [organization: user, contractInstance: contractInstance, amendmentType: amendmentType]

        }
    }


    def save() {
        def amendmentInstance = new Amendment(params)

        def file = request.getFile("amendmentDocument")
        try {
            amendmentInstance.fileName = file.originalFilename
            amendmentInstance.contentType = file.getContentType();
        }
        catch (Exception e) {
            amendmentInstance.fileName = ""
        }

        def userType = ""
        def conract = Contract.get(params.contractId)

        amendmentInstance.amendmentDate = new Date()
        amendmentInstance.contractNo = conract.contractNo
        amendmentInstance.contractPartNo = conract.contractPartNo
        amendmentInstance.dealerBroker = "N"
        amendmentInstance.buyerBroker = "N"
        amendmentInstance.manufacturer = "N"
        amendmentInstance.supplier = "N"
        amendmentInstance.finished = "N"

        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            if (user instanceof Broker) {
                if (user.brokerType == "BuyerBroker") {
                    userType = "BuyerBroker"
                    amendmentInstance.buyerBroker = "Y"
                    amendmentInstance.dealerBroker = "Y"
                } else if (user.brokerType == "DealerBroker") {
                    userType = "DealerBroker"
                    amendmentInstance.dealerBroker = "Y"
                    amendmentInstance.supplier = "Y"
                }
            } else if (user instanceof Supplier) {
                amendmentInstance.supplier = "Y"
                amendmentInstance.manufacturer = "Y"
                userType = "Supplier"
            }
        }

        amendmentInstance.addToPhases new Phase(phase: userType, comment: "", organization: null, startDate: new Date(), status: "Waiting").save()
        if (!amendmentInstance.save(flush: true)) {
            render(view: "create", model: [amendmentInstance: amendmentInstance])
            return
        }
        conract.addToAmendments(amendmentInstance)
        conract.save()
//        flash.message = message(code: 'default.created.message', args: [message(code: 'amendment.label', default: 'Amendment'), amendmentInstance.id])
//        redirect(action: "show", id: amendmentInstance.id)
        render 0
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

    def getDocument() {
        def amendment = Amendment.get(params.id)
        if (amendment){
            response.contentType = amendment.contentType
            response.outputStream << amendment.amendmentDocument
            response.outputStream.flush()
        }
    }
}
