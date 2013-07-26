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

    def saveAmendmentPhase() {
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

        def amendment = Amendment.get(params.amendmentId)
        def phaseId = Amendment.findSubmit(amendment, userType)
        def contract = Contract.findByContractNoAndContractPartNo(amendment.contractNo, amendment.contractPartNo)
        if (phaseId != "-1") {
            def prevPhase = Phase.get(params.phaseId)
            def phaseInstance = new Phase(params)
            prevPhase.status = params.status
            prevPhase.endDate = new Date()
//        def princ = springSecurityService.getPrincipal()
//        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
//            if (user instanceof Broker || user instanceof Supplier || user instanceof Manufacturer) {
            prevPhase.organization = user
//            }
//        }
            prevPhase.comment = phaseInstance.comment
            phaseInstance.startDate = new Date()
            phaseInstance.comment = ""


            if (contract) {
                if (contract.lastPhase == prevPhase.phase && params.status == 'Pass') {
                    if (amendment.freight)
                        contract.freight=amendment.freight
                    if (amendment.placeOfUnloading)
                        contract.placeOfUnloading=amendment.placeOfUnloading
                    if (amendment.addedTaxReceipt)
                        contract.addedTaxReceipt=amendment.addedTaxReceipt
                    if (amendment.addedTaxReceiptDate)
                        contract.addedTaxReceiptDate=amendment.addedTaxReceiptDate
                    contract.save()
                    amendment.status = "Visible"
                    phaseInstance.phase = "Finished"
                    phaseInstance.status = params.status
                } else {
                    if (prevPhase.phase == "BuyerBroker" && params.status == "Pass") {
                        phaseInstance.phase = "DealerBroker"
                    }
                    if (prevPhase.phase == "DealerBroker" && params.status == "Pass") {
                        phaseInstance.phase = "Supplier"
                    } else if (prevPhase.phase == "Supplier" && params.status == "Pass") {
                        phaseInstance.phase = "Manufacturer"
                    } else if (prevPhase.phase == "Manufacturer" && params.status == "Pass") {
                        phaseInstance.phase = "Finished"
//                    } else if (prevPhase.phase == "Manufacturer" && params.status == "Reject") {
//                        phaseInstance.phase = "Supplier"
//                    } else if (prevPhase.phase == "Supplier" && params.status == "Reject") {
//                        phaseInstance.phase = "DealerBroker"
//                    } else if (prevPhase.phase == "DealerBroker" && params.status == "Reject") {
//                        phaseInstance.phase = "BuyerBroker"
//                    }
                    } else if (params.status == "Reject") {
                        phaseInstance.phase = "Finished"
                    }
                }
                if (phaseInstance.phase == "Finished") {
                    phaseInstance.status = params.status
                } else {
                    phaseInstance.status = "Waiting"
                }

                if (!phaseInstance.save(flush: true)) {
                    return
                }
                prevPhase.save()
                phaseInstance.save()
                amendment.addToPhases(phaseInstance)
                amendment.save()
            }
        }
        render 0
        redirect(controller: "amendment", action: "list", params: [id: contract.id])
    }

    def save() {
        def prevPhase = Phase.get(params.phaseId)
        if (prevPhase.status == "Waiting") {
            prevPhase.status = params.status
            prevPhase.endDate = new Date()


            def phaseInstance = new Phase(params)
            phaseInstance.startDate = new Date()

            if (prevPhase.phase == "BuyerBroker" && params.status == "Pass") {
                phaseInstance.phase = "DealerBroker"
            }
            if (prevPhase.phase == "DealerBroker" && params.status == "Pass") {
                phaseInstance.phase = "Supplier"
            } else if (prevPhase.phase == "Supplier" && params.status == "Pass") {
                phaseInstance.phase = "Manufacturer"
            } else if (prevPhase.phase == "Manufacturer" && params.status == "Pass") {
                phaseInstance.phase = "Finished"
            } else if (prevPhase.phase == "Manufacturer" && params.status == "Reject") {
                phaseInstance.phase = "Supplier"
            } else if (prevPhase.phase == "Supplier" && params.status == "Reject") {
                phaseInstance.phase = "DealerBroker"
            } else if (prevPhase.phase == "DealerBroker" && params.status == "Reject") {
                phaseInstance.phase = "BuyerBroker"
            }
//        else if(prevPhase.phase=="BuyerBroker" && params.status=="Reject") {
//            phaseInstance.phase="DealerBroker"
//        }
            if (phaseInstance.phase == "Finished") {
                phaseInstance.status = "Pass"
            } else {
                phaseInstance.status = "Waiting"
            }
            def princ = springSecurityService.getPrincipal()
            if (princ instanceof GrailsUser) {
                def user = User.findByUsername(princ.username)
                if (user instanceof Broker || user instanceof Supplier || user instanceof Manufacturer) {
                    prevPhase.organization = user
                }

            }
//        prevPhase.organization = phaseInstance.organization
            prevPhase.comment = phaseInstance.comment
            phaseInstance.comment = ""
            prevPhase.save()
            if (!phaseInstance.save(flush: true)) {
//            render(view: "create", model: [phaseInstance: phaseInstance])
                return
            }
            def contract = Contract.get(params.contractId)

            contract.addToPhases(phaseInstance)
            if (contract.save()) {
                render phaseInstance.id
                redirect(controller: "contract", action: "showPhase", params: [id: contract.id])
            }
        } else {
            def contract = Contract.get(params.contractId)
            redirect(controller: "contract", action: "showPhase", params: [id: contract.id])
        }

//        render 0
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

    def cancel() {
        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            if (user instanceof Broker) {
                if (user.brokerType == "BuyerBroker") {
                    Contract contract = Contract.get(params.contractId)
                    Phase prevPhase
                    if (contract.phases) {
                        for (p in contract?.phases) {
                            if (p.status == 'Waiting')
                                prevPhase = p
                        }
                    }
                    def phaseInstance = new Phase(params)
                    if (prevPhase) {
                        if (prevPhase.phase != "BuyerBroker") {
                            prevPhase.status = "Terminate"
                            prevPhase.endDate = new Date()
                            prevPhase.organization = user
                            prevPhase.save()

                            phaseInstance.startDate = new Date()
                            phaseInstance.status = "Cancel"
                            phaseInstance.phase = "BuyerBroker"
                            phaseInstance.organization = user
                            if (!phaseInstance.save(flush: true)) {
                                return
                            }
                            contract.addToPhases(phaseInstance)
                            contract.save()
                        } else {
                            prevPhase.status = "Cancel"
                            prevPhase.endDate = new Date()
                            prevPhase.organization = user
                            prevPhase.comment = phaseInstance.comment
                            prevPhase.save()
                        }

                    }
                    render phaseInstance.id
                    redirect(controller: "contract", action: "showPhase", params: [id: contract.id])

                }
            }
        }
    }
}