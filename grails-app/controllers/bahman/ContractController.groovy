package bahman

import fi.joensuu.joyds1.calendar.JalaliCalendar
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.grails.plugins.excelimport.ExpectedPropertyType
import org.springframework.dao.DataIntegrityViolationException
import org.apache.poi.hssf.usermodel.HSSFWorkbook


class ContractController {
    def springSecurityService
    def phaseService
    def excelImportService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def delete() {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'contract'), params.id])
            redirect(action: "list")
            return
        }
        try {
            contractInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contract.label', default: 'contract'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contract.label', default: 'contract'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def show = {
        if (params.id) {
            def contract = Contract.findById(params.id)
            def princ = springSecurityService.getPrincipal()
            def code = ""
//            def desc = ""

            if (princ instanceof GrailsUser && contract) {
                def user = User.findByUsername(princ.username)
                String userType = ""
                if (user instanceof Broker) {
//                def subRoleB = SubRole.findByRoleName("Dealer")
//                def dealer =UserRole.findByUserAndSubRoles(user,subRoleB)
//                if (user.brokerType="Dealer")
//                if (!dealer ){
//                    code = contract.buyerBrokerCode
//                    userType="BuyerBroker"
//                }
//                else if (dealer){
//                    code = contract.dealerBrokerCode
//                    userType="DealerBroker"
//                }
                    userType = user.brokerType
                    if (user.brokerType == "BuyerBroker")
                        code = contract.buyerBrokerCode
                    else
                        code = contract.dealerBrokerCode
                }

                else if (user instanceof Customer) {
                    code = contract.customerCode
                    userType = "Customer"
                }
                else if (user instanceof Supplier) {
                    code = contract.supplierCode
                    userType = "Supplier"
                }
                else if (user instanceof Manufacturer) {
//                    desc = contract.manufacturerDesc
                    code = contract.supplierCode
                    userType = "Manufacturer"
                }
//            def lp=contract.lastPhase
                String limit = ""
                if (userType == contract.lastPhase)
                    limit = "Allowed"
                else
                    limit = "Illegal"
//
                String showAmendment = "False"
//                String phaseStatus = Contract.findByPhaseStatus(contract, userType)
//                if (phaseStatus.equals("Pass"))
                showAmendment = "True"
//                if (user.code == code || user.description == desc) {
                if (user.code == code) {
                    return [contractInstance: contract, userType: userType, limit: limit, showAmendment: showAmendment]
                }

            }
        }
    }

    def showPhase = {
        if (params.id) {
            def contract = Contract.findById(params.id)
            def princ = springSecurityService.getPrincipal()
            def code = ""
            def desc = ""

            if (princ instanceof GrailsUser && contract) {
                def user = User.findByUsername(princ.username)

                if (user instanceof Broker) {
//                    def subRoleB = SubRole.findByRoleName("Dealer")
//                    def dealer =UserRole.findByUserAndSubRoles(user,subRoleB)
//                    if (!dealer ){
//                        code = contract.buyerBrokerCode
//                    }
//                    else if (dealer){
//                        code = contract.dealerBrokerCode
//                    }
                    if (user.brokerType == "BuyerBroker") {
                        code = contract.buyerBrokerCode
                    }
                    else if (user.brokerType == "DealerBroker") {
                        code = contract.dealerBrokerCode
                    }

                }

                else if (user instanceof Customer) {
                    code = contract.customerCode
                }
                else if (user instanceof Supplier) {
                    code = contract.supplierCode
                }
                else if (user instanceof Manufacturer) {
                    code = contract.supplierCode
                    desc = contract.manufacturerDesc
                }
                if (user.code == code || user.description == desc) {
                    [contractInstance: contract]
                }

            }
        }
    }

    def list() {
        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            if (user instanceof Broker) {
//                def subRoleB = SubRole.findByRoleName("Dealer")
//                def dealer =UserRole.findByUserAndSubRoles(user,subRoleB)
                if (user.brokerType == "BuyerBroker") {
                    redirect(action: "buyerBroker", params: params)
                }
                else if (user.brokerType == "DealerBroker") {
                    redirect(action: "dealerBroker", params: params)
                }
            }

            else if (user instanceof Customer) {
                redirect(action: "Customer", params: params)
            }
            else if (user instanceof Supplier) {
                redirect(action: "Supplier", params: params)
            }
            else if (user instanceof Manufacturer) {
                redirect(action: "Manufacturer", params: params)
            }
        }

//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [contractInstanceList: Contract.list(params), contractInstanceTotal: Contract.count()]
    }

    def buyerBroker() {
        def princ = springSecurityService.getPrincipal()

        def user = User.findByUsername(princ.username)

        [organization: user]

    }

    def dealerBroker() {
        def princ = springSecurityService.getPrincipal()

        def user = User.findByUsername(princ.username)

        [organization: user]

    }

    def customer() {
        def princ = springSecurityService.getPrincipal()

        def user = User.findByUsername(princ.username)

        [customer: user]

    }

    def supplier() {
        def princ = springSecurityService.getPrincipal()

        def user = User.findByUsername(princ.username)

        [organization: user]

    }

    def manufacturer() {
        def princ = springSecurityService.getPrincipal()

        def user = User.findByUsername(princ.username)

        [organization: user]

    }

    def save = {
        def princ = springSecurityService.getPrincipal()

        def contract = new Contract(params)
        if (!contract.importDate)
            contract.importDate = new Date()
        if (!contract.dealerBrokerCode) {
            if (princ instanceof GrailsUser) {
                def user = User.findByUsername(princ.username)
                if (user instanceof Broker && user.brokerType == "DealerBroker") {
                    contract.dealerBrokerCode = user.code
                    contract.dealerBrokerDesc = user.description
                }
            }
        }
        if (!contract.buyerBrokerCode) {
            if (princ instanceof GrailsUser) {
                def user = User.findByUsername(princ.username)
                if (user instanceof Broker && user.brokerType == "BuyerBroker") {
                    contract.buyerBrokerCode = user.code
                    contract.buyerBrokerDesc = user.description
                }
            }
        }

        if (!contract.hasErrors() && contract.save()) {
            flash.message = "TekEvent ${contract.id} created"
            phaseService.addDefaultPhases(contract)
        }
        render 0
    }


    def edit = {
        def contractInstance = Contract.findById(params.id)
        if (contractInstance) {
            return [contractInstance: contractInstance]
        }
    }

    def getImage() {
        if (params.id) {
            def attachment = Attachment.get(params.id)
            String ct = attachment.contentType.substring(0, attachment.contentType.indexOf('/')).toLowerCase()
            if (ct == 'image') {
                response.contentType = 'image/png'
                response.outputStream << attachment.document
                response.outputStream.flush()
            }
//            else if(attachment.contentType.toLowerCase()=="application/pdf"){
//                def file= grailsAttributes.getApplicationContext().getResource("/images/pdf.png").getFile()
//                response.contentType = 'image/png'
//                response.outputStream << file
//                response.outputStream.flush()
//            }
        }
    }

    def editAttachmentPhase = {
        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)

            def contractInstance = Contract.get(params.id)
            if (!contractInstance) {
                return
            }
            def lastPhaseId = Contract.findByPhase(contractInstance)
            def lastPhase = Phase.get(lastPhaseId)
            if (lastPhase && user)
                [contractInstance: contractInstance, lastPhase: lastPhase, user: user]
        }
    }

    def editAttachmentPhaseDraft = {
        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)

            def contractInstance = Contract.get(params.id)
            if (!contractInstance) {
                return
            }
            def lastPhaseId = Contract.findByPhase(contractInstance)
            def lastPhase = Phase.get(lastPhaseId)
            if (lastPhase && user)
                [contractInstance: contractInstance, lastPhase: lastPhase, user: user]
        }
    }

    def showAttachmentPhase = {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
            return
        }
        //def lll=contractInstance.phases?.find(it?.status=="W")
        def lastPhaseId = Contract.findByPhase(contractInstance)
        def lastPhase = Phase.get(lastPhaseId)
        [contractInstance: contractInstance, lastPhase: lastPhase]
    }

    def importExcel() {

    }

    def upload() {
        def file = request.getFile('file')
        Workbook sb
        try {
            def fileIs = new ByteArrayInputStream(file.bytes)
            sb = new XSSFWorkbook(fileIs)
        } catch (x) {
            def fileIs = new ByteArrayInputStream(file.bytes)
            sb = new HSSFWorkbook(fileIs)
        }
        Map CONFIG_COLUMN_MAP = [
                sheet: 'Sheet1',
                startRow: 1,
                columnMap: [
                        'B': 'contractNo',
                        'C': 'contractPartNo',
                        'D': 'contractDate',
                        'E': 'allotmentDate',
                        'F': 'settlementDeadline',
                        'G': 'settlementType',
                        'H': 'dealerBrokerDesc',
                        'I': 'buyerBrokerDesc',
                        'J': 'customerDesc',
                        'K': 'productSymbol',
                        'L': 'productDesc',
                        'M': 'totalShipments',
                        'N': 'price',
                        'O': 'contractType',
                        'P': 'deliveryDate',
                        'Q': 'manufacturerDesc',
                        'R': 'deliveryPlace',
                        'S': 'productMainGroup',
                        'T': 'productGroup',
                        'U': 'productSubGroup',
                        'V': 'weight',
                        'W': 'quantity',
                        'X': 'buyerBrokerCode',
                        'Y': 'dealerBrokerCode',
                        'Z': 'customerCode',
                        'AA': 'supplierCode',
                        'AB': 'boursePrice',
                        'AC': 'settlementDate',
                        'AD': 'contractID',
                        'AE': 'releaseDate'
                ]
        ]
        Map propertyConfigurationMap = [:]
        CONFIG_COLUMN_MAP.columnMap.each {key, value ->
            propertyConfigurationMap[value] = [expectedType: ExpectedPropertyType.StringType, defaultValue: null]
        }

        def dateFields = ["contractDate", "allotmentDate", "settlementDeadline", "deliveryDate", "settlementDate", "releaseDate"]
        def res = excelImportService.columns(sb, CONFIG_COLUMN_MAP, null, propertyConfigurationMap)
        res.each {
            dateFields.each { field ->
                try {
                    def fff = it[field]
                    def dateParts = it[field].split("/").collect {it as Integer}
                    JalaliCalendar jc = new JalaliCalendar(dateParts[0], dateParts[1], dateParts[2])
                    def gc = jc.toJavaUtilGregorianCalendar()
                    it[field] = 'date.struct'
                    it["${field}_year"] = gc.get(Calendar.YEAR) as String
                    it["${field}_month"] = gc.get(Calendar.MONTH) as String
                    it["${field}_day"] = gc.get(Calendar.DATE) as String
                } catch (x) {x.printStackTrace()}
            }

            Contract contract = new Contract(it)
            contract.importDate = new Date()
            def oldContract = Contract.findByContractNoAndContractPartNo(contract.contractNo, contract.contractPartNo)
            if (oldContract) {
                oldContract.settlementDate = contract.settlementDate
                oldContract.save()
            }
            else {
                contract.save()
                phaseService.addDefaultPhases(contract)
            }

        }

        redirect(action: "list")
    }

    def showAttachmentPhaseDraft() {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
            return
        }
        //def lll=contractInstance.phases?.find(it?.status=="W")
        def lastPhaseId = Contract.findByPhase(contractInstance)
        def lastPhase = Phase.get(lastPhaseId)
        [contractInstance: contractInstance, lastPhase: lastPhase]
    }

    def update() {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'contract'), params.id])
            redirect(action: "list")
            return
        }
        if (params.version) {
            def version = params.version.toLong()
            if (contractInstance.version > version) {
                contractInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'contract.label', default: 'contract')] as Object[],
                        "Another user has updated this contract while you were editing")
                render(view: "edit", model: [contractInstance: contractInstance])
                return
            }
        }

        contractInstance.properties = params

        if (!contractInstance.save(flush: true)) {
            render(view: "edit", model: [contractInstance: contractInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contract.label', default: 'contract'), contractInstance.id])
        redirect(action: "show", id: contractInstance.id)
    }

}
