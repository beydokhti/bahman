package bahman

import fi.joensuu.joyds1.calendar.JalaliCalendar
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class DraftController {
    def springSecurityService
    def smsService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [draftInstanceList: Draft.list(params), draftInstanceTotal: Draft.count()]
    }

    def create() {
        [draftInstance: new Draft(params)]
    }

    def save() {
        def draftInstance = new Draft(params)
        if (!draftInstance.save(flush: true)) {
            render(view: "create", model: [draftInstance: draftInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'draft.label', default: 'Draft'), draftInstance.id])
        redirect(action: "show", id: draftInstance.id)
    }

    def show() {
        def draftInstance = Draft.get(params.id)
        if (!draftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'draft.label', default: 'Draft'), params.id])
            redirect(action: "list")
            return
        }

        [draftInstance: draftInstance]
    }

    def edit() {
        def draftInstance = Draft.get(params.id)
        if (!draftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'draft.label', default: 'Draft'), params.id])
            redirect(action: "list")
            return
        }

        [draftInstance: draftInstance]
    }

    def update() {
        def draftInstance = Draft.get(params.id)
        if (!draftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'draft.label', default: 'Draft'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (draftInstance.version > version) {
                draftInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'draft.label', default: 'Draft')] as Object[],
                        "Another user has updated this Draft while you were editing")
                render(view: "edit", model: [draftInstance: draftInstance])
                return
            }
        }

        draftInstance.properties = params

        if (!draftInstance.save(flush: true)) {
            render(view: "edit", model: [draftInstance: draftInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'draft.label', default: 'Draft'), draftInstance.id])
        redirect(action: "show", id: draftInstance.id)
    }

    def delete() {
        def draftInstance = Draft.get(params.id)
        if (!draftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'draft.label', default: 'Draft'), params.id])
            redirect(action: "list")
            return
        }

        try {
            draftInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'draft.label', default: 'Draft'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'draft.label', default: 'Draft'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def saveDraft() {

        def draftInstance = new Draft(params)
        def file = request.getFile("document")
        try {
            draftInstance.fileName = file.originalFilename
            draftInstance.contentType = file.getContentType();
        }
        catch (Exception e) {
        }

        draftInstance.uploadDate = new Date()
        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            def org
            if (user instanceof Broker || user instanceof Supplier || user instanceof Manufacturer) {
                draftInstance.responsible = user
            }

        }
        def contract = Contract.get(params.contractId)
        def tempDraft = contract.drafts

        if (!draftInstance.description) {
            if (contract.drafts) {
                draftInstance.description = tempDraft?.description
            } else {
                Manufacturer manufacturer = contract.manufacturer
                if (manufacturer.draftNoSequence && manufacturer.code == "567") {

                    def cal = Calendar.getInstance()
                    cal.setTime(new Date())
                    def jc = new JalaliCalendar(cal)
                    def formatDraft = "SP" + jc.year.toString().substring(2)
                    draftInstance.description = manufacturer.draftNoSequence.toString()
                    manufacturer.draftNoSequence =Integer.valueOf( manufacturer.draftNoSequence ) + 1 + ""
                    manufacturer.save()
                    def countOfPadding = 6
                    if (draftInstance.description.length() <= countOfPadding)
                        draftInstance.description = formatDraft + draftInstance.description.padLeft(countOfPadding, '0')
                }
            }
        }
        if (tempDraft) {
            draftInstance.versionNo = Integer.valueOf(tempDraft.versionNo) + 1 + ""
            try {
                contract.drafts = null
                DraftHist oldDraft = new DraftHist()

                oldDraft.description = tempDraft.description
                oldDraft.contentType = tempDraft.contentType
                oldDraft.document = tempDraft.document
                oldDraft.fileName = tempDraft.fileName
                oldDraft.responsible = tempDraft.responsible
                oldDraft.uploadDate = tempDraft.uploadDate
                oldDraft.versionNo = tempDraft.versionNo
                oldDraft.updateDate = new Date()

                if (oldDraft) {
                    oldDraft.save(flush: true)
                    tempDraft.delete(flush: true)
                }
            } catch (Exception e) { e.printStackTrace() }


        } else {
            draftInstance.versionNo = "1"

        }
        if (!draftInstance.save(flush: true)) {
            flash.message = "draft.duplicated.error.label"
//                redirect(controller: params.rcontroller, action: params.raction, id: params.redirectId)
        } else {
            contract.drafts = draftInstance
            if (contract.save()) {
                if (contract.customer) {
                    def msg = message(code: "sms.smsMsg1") + contract.customerDesc + message(code: "sms.smsMsg2") + contract.contractNo + "/" + contract.contractPartNo
                    if (draftInstance.versionNo == 1) {
                        msg = msg + message(code: "sms.smsMsg3")

                    } else {
                        msg = msg + message(code: "sms.smsMsg5")
                    }
                    msg = msg + draftInstance.description + message(code: "sms.smsMsg4")
                    smsService.sendSms(msg, contract.customer.mobileNo)
                }

            }
        }
        redirect(controller: params.rcontroller, action: params.raction, id: params.redirectId)


    }

    def deleteDraft() {
        def draftInstance = Draft.get(params.id)
        if (!draftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'draft.label', default: 'Draft'), params.id])
            redirect(action: "list")
            return
        }


        try {
            def contract = Contract.get(params.contractId)

            DraftHist oldDraft = new DraftHist()

            oldDraft.description = draftInstance.description
            oldDraft.contentType = draftInstance.contentType
            oldDraft.document = draftInstance.document
            oldDraft.fileName = draftInstance.fileName
            oldDraft.responsible = draftInstance.responsible
            oldDraft.uploadDate = draftInstance.uploadDate
            oldDraft.versionNo = draftInstance.versionNo
            oldDraft.updateDate = new Date()

            oldDraft.save(flush: true)
            contract.drafts = null
            contract.save(flush: true)

        } catch (Exception e) { e.printStackTrace() }


        try {
            draftInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'draft.label', default: 'Draft'), params.id])
//            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'draft.label', default: 'Draft'), params.id])
//            redirect(action: "show", id: params.id)
        }

        render 0
    }

    def printImage() {
        def draft = Draft.get(params.draftId)
        render(template: 'printImage', model: [draft: draft])
    }

    def printView() {
        def draft = Draft.get(params.draftId)
//        render(template: 'printImage', model: [attachment: attachment])
        return ([draft: draft])

    }

    def getImage() {
        if (params.id) {
            def draft = Draft.get(params.id)
            response.contentType = 'image/png'
            response.outputStream << draft.document
            response.outputStream.flush()
        }
    }

    def downloadDraft() {
        def draft = Draft.get(params.id)
        byte[] content = draft.document
        if (!draft) {
            response.sendError(404, "Not Found \n")
            return
        }
        response.setHeader("Content-disposition", "draft; filename = ${draft.fileName}");//render(contentType: "${draft.contentType}", text:"mtb");
//        response.contentType = "application/octet-stream"
        response.contentType = draft.contentType
        response.outputStream << content
        response.outputStream.flush()
    }

    def showDraftDetails() {
        def draftInstance = Draft.get(params.id)

        if (!draftInstance)
            draftInstance = new Draft()

        render(view: "show", model: [draftInstance: draftInstance])
    }

    def form() {
        Contract contract = Contract.get(params.contractId)
        String errorMsg = ""
        def draftInstance = new Draft()

        if (contract.drafts) {
            draftInstance.description = contract?.drafts?.description
        } else {
//            if (manufacturer.draftNoFormat && manufacturer.draftNoSequence) {
//                def formatDraft = manufacturer.draftNoFormat.substring(0, contract.manufacturer.draftNoFormat.indexOf('#'))
//                draftInstance.description = manufacturer.draftNoSequence.toString()
//                manufacturer.draftNoSequence=manufacturer.draftNoSequence+1
//                manufacturer.save()
//                if (draftInstance.description.length()<manufacturer.draftNoFormat.count('#'))
//                    draftInstance.description =formatDraft + draftInstance.description.padLeft(manufacturer.draftNoFormat.count('#'), '0')
//            } else {
//                errorMsg = message(code: 'error.null.draftno.format')
//            }
            if (!contract.manufacturer.draftNoSequence) {
                errorMsg = message(code: 'error.null.draftno.format')
            }
        }
        render(template: 'form', model: [draftInstance: draftInstance, errorMsg: errorMsg])
    }

}
