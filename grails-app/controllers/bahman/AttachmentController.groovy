package bahman

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class AttachmentController {
    def springSecurityService
    def smsService

    static allowedMethods = [update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [attachmentInstanceList: Attachment.list(params), attachmentInstanceTotal: Attachment.count()]
    }

    def create() {
        [attachmentInstance: new Attachment(params)]
    }
    def deleteAttachment(){
//        def contract=Contract.get(params.contractId)
        def att=Attachment.get(params.id)
//        contract.removeFromAttachments(att)
//        contract.save()
//        att.delete()
        if (att)
        {
            att.status="R"
            att.save()
        }
        render 0;
    }
    def save() {
        def attachmentInstance = new Attachment(params)
//        def contentType = attachmentInstance.document.contentType
//        def fileName = attachmentInstance.document.originalFilename
//        def size = attachmentInstance.document.size
//        attachmentInstance.fileName=request.getFileNames()
        def file = request.getFile("document")
        try {
            attachmentInstance.fileName=file.originalFilename
            attachmentInstance.contentType=file.getContentType();
        }
       catch (Exception e){
           attachmentInstance.fileName=""
       }

        attachmentInstance.uploadDate = new Date()
        attachmentInstance.status = 'P'
        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            def org
            if (user instanceof Broker || user instanceof Supplier || user instanceof Manufacturer) {
                attachmentInstance.responsible = user
            }

        }

        if (!attachmentInstance.save(flush: true)) {
//            render(view: "create", model: [attachmentInstance: attachmentInstance])
            return
        }
        def contract = Contract.get(params.contractId)
//        if (params.attr == "SC")
//            contract.settlementCertificate = attachmentInstance
//        if (params.attr == "VA")
//            contract.valueAddedTax = attachmentInstance
//        if (params.attr == "AF")
//            contract.applicationForm = attachmentInstance
//        if (params.attr == "Attachment")
            contract.addToAttachments(attachmentInstance)
        if (contract.save()) {
            if (params.attr == "Attachment")
                render(template: "../contract/viewAttachment", model: [attachment: attachmentInstance])
            else
                render attachmentInstance as JSON
        }//attachmentInstance as JSON
//        flash.message = message(code: 'default.created.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachmentInstance.id])
//        redirect(action: "show", id: attachmentInstance.id)
    }


    def saveDraft() {
        def attachmentInstance = new Attachment(params)
        def file = request.getFile("document")
        try {
            attachmentInstance.fileName=file.originalFilename
            attachmentInstance.contentType=file.getContentType();
        }
        catch (Exception e){
        }

        attachmentInstance.uploadDate = new Date()
        attachmentInstance.status = 'P'
        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            def org
            if (user instanceof Broker || user instanceof Supplier || user instanceof Manufacturer) {
                attachmentInstance.responsible = user
            }

        }

        def contract = Contract.get(params.contractId)
        Integer version=1
        for (d in contract.drafts)
        {
            d.status='R'
            d.save()
            version ++
        }
        attachmentInstance.version=version
        if (!attachmentInstance.save(flush: true)) {
            return
        }
        contract.addToDrafts(attachmentInstance)
        if (contract.save()) {
                def customer=Customer.findByCode(contract.customerCode)
                if (customer){
                def msg = message(code: "sms.smsMsg1")  +contract.customerDesc+message(code: "sms.smsMsg2") +contract.contractNo+"/"+contract.contractPartNo+message(code: "sms.smsMsg3")
                msg =msg+attachmentInstance.description+message(code: "sms.smsMsg4")

                smsService.sendSms(msg,customer.mobileNo)
                    }
            if (params.attr == "Attachment")
                render(template: "../contract/viewAttachment", model: [attachment: attachmentInstance,type:'Draft'])
            else
                render attachmentInstance as JSON
        }

    }

    def getImage() {
        if (params.id) {
            def attachment = Attachment.get(params.id)
            response.contentType = 'image/png'
            response.outputStream << attachment.document
            response.outputStream.flush()
        }
    }

    def form() {

        def attachmentInstance
        if (params.id)
            attachmentInstance = Attachment.get(params.id)
        else
            attachmentInstance = new Attachment()
        render(template: 'form', model: [attachmentInstance: attachmentInstance])
    }


    def show() {
        def attachmentInstance = Attachment.get(params.id)
        if (!attachmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])
            redirect(action: "list")
            return
        }

        [attachmentInstance: attachmentInstance]
    }

    def showDetails() {
        def contract = Contract.get(params.id)
        def attachmentInstance
        if (params.att == 'SC')
            attachmentInstance = Attachment.get(contract?.settlementCertificate?.id)
        if (params.att == 'VA')
            attachmentInstance = Attachment.get(contract?.valueAddedTax?.id)
        if (params.att == 'AF')
            attachmentInstance = Attachment.get(contract?.applicationForm?.id)
        if (!attachmentInstance)
            attachmentInstance = new Attachment()

        render(view: "show", model: [attachmentInstance: attachmentInstance])
    }

    def showAttachmentDetails() {
        def attachmentInstance = Attachment.get(params.id)

        if (!attachmentInstance)
            attachmentInstance = new Attachment()

        render(view: "show", model: [attachmentInstance: attachmentInstance])
    }

    def edit() {
        def attachmentInstance = Attachment.get(params.id)
        if (!attachmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])
            redirect(action: "list")
            return
        }

        [attachmentInstance: attachmentInstance]
    }

    def update() {
        def attachmentInstance = Attachment.get(params.id)
        if (!attachmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (attachmentInstance.version > version) {
                attachmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'attachment.label', default: 'Attachment')] as Object[],
                        "Another user has updated this Attachment while you were editing")
                render(view: "edit", model: [attachmentInstance: attachmentInstance])
                return
            }
        }

        attachmentInstance.properties = params

        if (!attachmentInstance.save(flush: true)) {
            render(view: "edit", model: [attachmentInstance: attachmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachmentInstance.id])
        redirect(action: "show", id: attachmentInstance.id)
    }

    def delete() {
        def attachmentInstance = Attachment.get(params.id)
        if (!attachmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])
            redirect(action: "list")
            return
        }

        try {
            attachmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
    def downloadAttachment(){
        def attachment = Attachment.get(params.id)
        byte[] content = attachment.document
        if (!attachment ) {
            response.sendError(404, "Not Found \n")
            return
        }
        response.setHeader("Content-disposition", "attachment; filename = ${attachment.fileName}");//render(contentType: "${attachment.contentType}", text:"mtb");
        response.contentType = "application/octet-stream"
        response.outputStream << content
        response.outputStream.flush()
    }

    def printImage(){
        def attachment = Attachment.get(params.attachmentId)
        render(template: 'printImage', model: [attachment: attachment])
    }

}
