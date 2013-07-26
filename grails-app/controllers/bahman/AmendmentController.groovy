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

        def contractInstance = Contract.get(params.id)
        if (!contractInstance)
            contractInstance = Contract.get(params.contractId)

        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            def amendmentType
            def userType
            String createAmendment = "False"

            if (user instanceof Broker) {
                if (user.brokerType == "BuyerBroker") {
                    userType = "BuyerBroker"
                } else if (user.brokerType == "DealerBroker") {
                    userType = "DealerBroker"
                }

                String contractPhaseStatus = Contract.findByPhaseStatus(contractInstance, userType)
                if (contractPhaseStatus == "Pass")
                    createAmendment = "True"
            } else if (user instanceof Customer) {
                userType = "Finished"
            } else if (user instanceof Supplier) {
                userType = "Supplier"
            } else if (user instanceof Manufacturer) {
                userType = "Manufacturer"
            }



            [organization: user, contractInstance: contractInstance, userType: userType, createAmendment: createAmendment]

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
        amendmentInstance.status="Invisible"
        amendmentInstance.contractNo = conract.contractNo
        amendmentInstance.contractPartNo = conract.contractPartNo

        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            if (user instanceof Broker) {
                if (user.brokerType == "BuyerBroker") {
                    userType = "BuyerBroker"
                } else if (user.brokerType == "DealerBroker") {
                    userType = "DealerBroker"
                }
            } else if (user instanceof Supplier) {
                userType = "Supplier"
            }
        }

        def userLevel = Phase.findByPhaseName(userType)

        amendmentInstance.addToPhases new Phase(phase: Phase.findByPhaseLevel(userLevel), comment: "ارسال اصلاحیه", organization: null, startDate: new Date(), status: "Pass", endDate: new Date()).save()
        amendmentInstance.addToPhases new Phase(phase: Phase.findByPhaseLevel(userLevel + 1), comment: "", organization: null, startDate: new Date(), status: "Waiting").save()
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
        def showDelete = "False"
        def phaseId="-1"
        try {
            def userType = ""
            def princ = springSecurityService.getPrincipal()
            if (princ instanceof GrailsUser) {
                def user = User.findByUsername(princ.username)
                if (user instanceof Broker) {
                    if (user.brokerType == "BuyerBroker") {
                        userType = "BuyerBroker"
                    } else if (user.brokerType == "DealerBroker") {
                        userType = "DealerBroker"
                    }
                } else if (user instanceof Supplier) {
                    userType = "Supplier"
                }
            }
            def starter = Amendment.findStarter(amendmentInstance)
            if (starter.equals(userType))
                showDelete = "True"

            phaseId = Amendment.findSubmit(amendmentInstance ,userType)


        } catch (Exception e) {

        }
        [amendmentInstance: amendmentInstance, showDelete: showDelete,phaseId:phaseId]
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
        if (amendment) {
            response.contentType = amendment.contentType
            response.addHeader("Content-disposition", "attachment; filename=\"" + amendment.fileName + "\"");
            response.outputStream << amendment.amendmentDocument
            response.outputStream.flush()
        }
    }
    def downloadAmendment() {
        def amendment = Amendment.get(params.id)
        byte[] content = amendment.amendmentDocument
        if (!amendment) {
            response.sendError(404, "Not Found \n")
            return
        }
        response.setHeader("Content-disposition", "amendment; filename = ${amendment.fileName}");//render(contentType: "${amendment.contentType}", text:"mtb");
//        response.contentType = "application/octet-stream"
        response.contentType = amendment.contentType
        response.outputStream << content
        response.outputStream.flush()
    }

    def printImage() {
        def amendment = Amendment.get(params.amendmentId)
        render(template: 'printImage', model: [amendment: amendment])
    }

    def printView() {
        def amendment = Amendment.get(params.amendmentId)
//        render(template: 'printImage', model: [amendment: amendment])
        return ([amendment: amendment])
    }
    def showAmendmentDetails() {
        def amendmentInstance = Amendment.get(params.id)

        if (!amendmentInstance)
            amendmentInstance = new Amendment()

        render(view: "showDetails", model: [amendmentInstance: amendmentInstance])
    }
    def getImage() {
        if (params.id) {
            def amendmentInstance = Amendment.get(params.id)
            response.contentType = 'image/png'
            response.outputStream << amendmentInstance.amendmentDocument
            response.outputStream.flush()
        }
    }

    def create (){
        [amendmentInstance: new Amendment(params),contractId:params.contractId ]

    }

    def form() {

        Amendment amendment
        if (params.id)
            amendment = amendment.get(params.id)
        else
            amendment = new Amendment()
        render(template: 'form', model: [amendmentInstance: amendment])
    }

    def saveBroker(){
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
        amendmentInstance.status="Invisible"
        amendmentInstance.contractNo = conract.contractNo
        amendmentInstance.contractPartNo = conract.contractPartNo

        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            if (user instanceof Broker) {
                if (user.brokerType == "BuyerBroker") {
                    userType = "BuyerBroker"
                } else if (user.brokerType == "DealerBroker") {
                    userType = "DealerBroker"
                }
            } else if (user instanceof Supplier) {
                userType = "Supplier"
            }
        }

        def userLevel = Phase.findByPhaseName(userType)

        amendmentInstance.addToPhases new Phase(phase: Phase.findByPhaseLevel(userLevel), comment: "ارسال اصلاحیه", organization: null, startDate: new Date(), status: "Pass", endDate: new Date()).save()
        amendmentInstance.addToPhases new Phase(phase: Phase.findByPhaseLevel(userLevel + 1), comment: "", organization: null, startDate: new Date(), status: "Waiting").save()
        if (!amendmentInstance.save(flush: true)) {
            render(view: "create", model: [amendmentInstance: amendmentInstance])
            return
        }
        conract.addToAmendments(amendmentInstance)
        conract.save()
//        flash.message = message(code: 'default.created.message', args: [message(code: 'amendment.label', default: 'Amendment'), amendmentInstance.id])
//        redirect(action: "show", id: amendmentInstance.id)
        redirect(action: "list", params: [contractId: conract.id])

    }
}
