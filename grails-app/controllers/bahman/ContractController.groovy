package bahman

import bahman.report.ContractReport
import fi.joensuu.joyds1.calendar.JalaliCalendar
import grails.plugin.jxl.builder.ExcelBuilder
import groovy.xml.StreamingMarkupBuilder
import groovy.xml.XmlUtil
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.grails.plugins.excelimport.ExpectedPropertyType
import org.springframework.dao.DataIntegrityViolationException
import org.apache.poi.hssf.usermodel.HSSFWorkbook

import java.text.DecimalFormat


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
                } else if (user instanceof Customer) {
                    code = contract.customerCode
                    userType = "Customer"
                } else if (user instanceof Supplier) {
                    code = contract.supplierCode
                    userType = "Supplier"
                } else if (user instanceof Manufacturer) {
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
                def customer = Customer.findByCode(contract.customerCode)

                def addedTax = Math.round(0.06 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity))
                def fees = Math.round(0.00048 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)) + Math.round(0.0018 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)) + Math.round(0.0005 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity))
                def contractValue = Math.round(1.00 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity))
                def shareSeller = contractValue - fees

                def cancel = false
                if (contract.phases.sort { -it.id }?.find { true }.status == "Cancel")
                    cancel = true

//                if (user.code == code || user.description == desc) {
                if (user.code == code) {
                    return [contractInstance: contract, userType: userType, limit: limit, showAmendment: showAmendment, addedTax: addedTax, fees: fees, contractValue: contractValue, shareSeller: shareSeller, cancel: cancel]
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
                    } else if (user.brokerType == "DealerBroker") {
                        code = contract.dealerBrokerCode
                    }

                } else if (user instanceof Customer) {
                    code = contract.customerCode
                } else if (user instanceof Supplier) {
                    code = contract.supplierCode
                } else if (user instanceof Manufacturer) {
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
                } else if (user.brokerType == "DealerBroker") {
                    redirect(action: "dealerBroker", params: params)
                }
            } else if (user instanceof Customer) {
                redirect(action: "Customer", params: params)
            } else if (user instanceof Supplier) {
                redirect(action: "Supplier", params: params)
            } else if (user instanceof Manufacturer) {
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
        def custRole = Role.findByAuthority("Customer")
        def manRole = Role.findByAuthority("Manufacturer")
        def supRole = Role.findByAuthority("Supplier")
        def bbRole = Role.findByAuthority("BuyerBroker")

        def customer1
        def broker1
        def manufacturer1
        def supplier1

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
        try {
            customer1 = null
            customer1 = Customer.findByCode(contract.customerCode) ?: new Customer(code: contract.customerCode,
                    description: contract.customerDesc,
                    username: "client" + contract.customerCode,
                    password: "pass" + contract.customerCode,
                    enabled: false).save()
            if (!customer1.equals(null)) {
                UserRole.findByUser(customer1) ?: UserRole.create(customer1, custRole)
            }

        } catch (Exception e) { e.printStackTrace() }
        contract.customer = customer1

        try {
            broker1 = null
            broker1 = Broker.findByCodeAndBrokerType(contract.buyerBrokerCode, "BuyerBroker") ?: new Broker(code: contract.buyerBrokerCode,
                    description: contract.buyerBrokerDesc,
                    username: "broker" + contract.buyerBrokerCode,
                    password: "pass" + contract.buyerBrokerCode,
                    brokerType: "BuyerBroker",
                    enabled: false).save()
            if (!broker1.equals(null)) {
                UserRole.findByUser(broker1) ?: UserRole.create(broker1, bbRole)
            }

        } catch (Exception e) { e.printStackTrace() }
        contract.buyerBroker = broker1

        try {
            manufacturer1 = null
            manufacturer1 = Manufacturer.findByCode(contract.supplierCode) ?: new Manufacturer(code: contract.supplierCode,
                    description: contract.manufacturerDesc,
                    username: "producer" + contract.supplierCode,
                    password: "pass" + contract.supplierCode,
                    enabled: false).save()
            if (!broker1.equals(null)) {
                UserRole.findByUser(manufacturer1) ?: UserRole.create(manufacturer1, manRole)
            }

        } catch (Exception e) { e.printStackTrace() }
        contract.manufacturer = manufacturer1

        try {
            supplier1 = null
            supplier1 = Supplier.findByCode(contract.supplierCode) ?: new Supplier(code: contract.supplierCode,
                    description: contract.manufacturerDesc,
                    username: "supplier" + contract.supplierCode,
                    password: "pass" + contract.supplierCode,
                    enabled: false).save()
            if (!broker1.equals(null)) {
                UserRole.findByUser(supplier1) ?: UserRole.create(supplier1, supRole)
            }

        } catch (Exception e) { e.printStackTrace() }
        contract.supplier = supplier1

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

    def getImageAmendment() {
        if (params.id) {
            def amendment = Amendment.get(params.id)
            String ct = amendment.contentType.substring(0, amendment.contentType.indexOf('/')).toLowerCase()
            if (ct == 'image') {
                response.contentType = 'image/png'
                response.outputStream << amendment.amendmentDocument
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

    def excel() {
        def status = params.id
        def dealerBrokerCode = params.dealerBrokerCode
        def princ = springSecurityService.getPrincipal()
        def eqString = ""
        def userType
        User user
        if (princ instanceof GrailsUser) {
            user = User.findByUsername(princ.username)
            if (user instanceof Broker) {
                if (user.brokerType == "BuyerBroker") {
                    userType = "BuyerBroker"
                    eqString = "buyerBrokerCode"
                } else if (user.brokerType == "DealerBroker") {
                    userType = "DealerBroker"
                    eqString = "dealerBrokerCode"
                }
            } else if (user instanceof Customer) {
                eqString = "customerCode"
            } else if (user instanceof Supplier) {
                userType = "Supplier"
                eqString = "supplierCode"
            } else if (user instanceof Manufacturer) {
                userType = "Manufacturer"
                eqString = "supplierCode"
            }
        }

        def criteria = {

            eq(eqString, user.code)
            switch (status) {
                case "w1":
                    createAlias "phases", "m"
                    eq "m.status", "Waiting"
                    eq "m.phase", userType
                    break
                case "w2":
                    createAlias "phases", "m"
                    eq "m.status", "Waiting"
                    ne "m.phase", "DealerBroker"
                    break
                case "m":
                    createAlias "phases", "m"
                    eq "m.phase", "Finished"
                    break
                case "a":
                    isNotEmpty "amendments"
                    break
                case "c":
                    createAlias "phases", "m"
                    eq "m.status", "Cancel"
                    eq "m.phase", "BuyerBroker"
                    break
            }
        }

        def contracts = Contract.withCriteria(criteria)

        def renderClosure = {
            sheet('Contracts') {
                cell(0, 0, g.message(code: 'contractNo'))
                cell(1, 0, g.message(code: 'contractPartNo'))
                cell(2, 0, g.message(code: 'contractDate'))
                cell(3, 0, g.message(code: 'allotmentDate'))
                cell(4, 0, g.message(code: 'settlementDeadline'))
                cell(5, 0, g.message(code: 'settlementType'))
                cell(6, 0, g.message(code: 'buyerBrokerDesc'))
                cell(7, 0, g.message(code: 'dealerBrokerDesc'))
                cell(8, 0, g.message(code: 'customerDesc'))
                cell(9, 0, g.message(code: 'productSymbol'))
                cell(10, 0, g.message(code: 'productDesc'))
                cell(11, 0, g.message(code: 'totalShipments'))
                cell(12, 0, g.message(code: 'price'))
                cell(13, 0, g.message(code: 'contractType'))
                cell(14, 0, g.message(code: 'deliveryDate'))
                cell(15, 0, g.message(code: 'manufacturerDesc'))
                cell(16, 0, g.message(code: 'deliveryPlace'))
                cell(17, 0, g.message(code: 'productMainGroup'))
                cell(18, 0, g.message(code: 'productGroup'))
                cell(19, 0, g.message(code: 'productSubGroup'))
                cell(20, 0, g.message(code: 'weight'))
                cell(21, 0, g.message(code: 'quantity'))
                cell(22, 0, g.message(code: 'buyerBrokerCode'))
                cell(23, 0, g.message(code: 'dealerBrokerCode'))
                cell(24, 0, g.message(code: 'customerCode'))
                cell(25, 0, g.message(code: 'contract.supplierCode'))
                cell(26, 0, g.message(code: 'boursePrice'))
                cell(27, 0, g.message(code: 'settlementDate'))
                cell(28, 0, g.message(code: 'contractID'))
                cell(29, 0, g.message(code: 'releaseDate'))
                cell(30, 0, g.message(code: 'importDate'))
                cell(31, 0, g.message(code: 'contract.freight'))
                cell(32, 0, g.message(code: 'contract.placeOfUnloading'))
                cell(33, 0, g.message(code: 'contract.addedTaxReceipt'))
                cell(34, 0, g.message(code: 'contract.addedTaxReceiptDate'))
                cell(34, 0, g.message(code: 'contract.phase'))

                contracts.eachWithIndex { Contract contract, index ->
//                    //cell(0, index + 1, contract.prevStatus)
//                    cell(1, index + 1, contract.contractNo)
//                    cell(2, index + 1, contract.contractPartNo)
//                    cell(3, index + 1, contract.buyerBrokerDesc)
//                    cell(4, index + 1, contract.dealerBrokerDesc)
//                    cell(5, index + 1, contract.customerDesc)
//
//                    cell(7, index + 1, contract?.drafts?.description ?: "")
//                    cell(8, index + 1, contract.productSymbol)
                    cell(0, index + 1, contract?.contractNo)
                    cell(1, index + 1, contract?.contractPartNo)
                    cell(2, index + 1, formatDate(contract?.contractDate))
                    cell(3, index + 1, formatDate(contract?.allotmentDate))
                    cell(4, index + 1, formatDate(contract?.settlementDeadline))
                    if (contract?.settlementType)
                        cell(5, index + 1, contract?.settlementType)
                    cell(6, index + 1, contract?.buyerBrokerDesc)
                    cell(7, index + 1, contract?.dealerBrokerDesc)
                    cell(8, index + 1, contract?.customerDesc)
                    cell(9, index + 1, contract?.productSymbol)
                    cell(10, index + 1, contract?.productDesc)
                    cell(11, index + 1, contract?.totalShipments)
                    cell(12, index + 1, contract?.price)
                    cell(13, index + 1, contract?.contractType)
                    cell(14, index + 1, contract?.deliveryDate)
                    cell(15, index + 1, contract?.manufacturerDesc)
                    cell(16, index + 1, contract?.deliveryPlace)
                    cell(17, index + 1, contract?.productMainGroup)
                    if (contract?.productGroup)
                        cell(18, index + 1, contract?.productGroup)
                    if (contract?.productSubGroup)
                        cell(19, index + 1, contract?.productSubGroup)
                    if (contract?.weight)
                        cell(20, index + 1, contract?.weight)
                    if (contract?.quantity)
                        cell(21, index + 1, contract?.quantity)
                    if (contract?.buyerBrokerCode)
                        cell(22, index + 1, contract?.buyerBrokerCode)
                    if (contract?.dealerBrokerCode)
                        cell(23, index + 1, contract?.dealerBrokerCode)
                    if (contract?.customerCode)
                        cell(24, index + 1, contract?.customerCode)
                    if (contract.supplierCode)
                        cell(25, index + 1, contract?.supplierCode)
                    if (contract?.boursePrice)
                        cell(26, index + 1, contract?.boursePrice)
                    if (contract?.settlementDate)
                        cell(27, index + 1, formatDate(contract?.settlementDate))
                    if (contract?.contractID)
                        cell(28, index + 1, contract?.contractID)
                    if (contract?.releaseDate)
                        cell(29, index + 1, formatDate(contract?.releaseDate))
                    if (contract?.importDate)
                        cell(30, index + 1, formatDate(contract?.importDate))
                    if (contract?.freight)
                        cell(31, index + 1, contract?.freight)
                    if (contract?.placeOfUnloading)
                        cell(32, index + 1, contract?.placeOfUnloading)
                    if (contract?.addedTaxReceipt)
                        cell(33, index + 1, contract?.addedTaxReceipt)
                    if (contract?.addedTaxReceiptDate)
                        cell(34, index + 1, formatDate(contract?.addedTaxReceiptDate))
                    cell(34, index + 1, g.message(code: contract?.phases?.sort { -it.id }?.find { true }?.phase))
                }
            }
        }
        def stream = new ByteArrayOutputStream()
        new ExcelBuilder().workbook(stream, renderClosure)
        response.contentType = 'application/excel'
        response.setHeader("Content-disposition", "attachment;filename=export.xls")
        response.outputStream << stream.toByteArray()

    }

    def upload() {
        def file = request.getFile('file')
//        if (file.contentType=='application/vnd.ms-excel' ){
        try {
            def custRole = Role.findByAuthority("Customer")
            def manRole = Role.findByAuthority("Manufacturer")
            def supRole = Role.findByAuthority("Supplier")
            def bbRole = Role.findByAuthority("BuyerBroker")

            def customer1
            def broker1
            def manufacturer1
            def supplier1
            def sb
            try {
                def fileIs = new ByteArrayInputStream(file.bytes)
                sb = new XSSFWorkbook(fileIs)
                println("step1")
            } catch (x) {
//            try {
                x.printStackTrace()
                def fileIs = new ByteArrayInputStream(file.bytes)
                sb = new HSSFWorkbook(fileIs)
                println("step2")
//            }catch (Exception e){
//                System.out.println(e.getMessage())
//            }
            }
            println("step3")
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
            CONFIG_COLUMN_MAP.columnMap.each { key, value ->
                propertyConfigurationMap[value] = [expectedType: ExpectedPropertyType.StringType, defaultValue: null]
            }

            println("step4")
            def dateFields = ["contractDate", "allotmentDate", "settlementDeadline", "deliveryDate", "settlementDate", "releaseDate"]
            def res = excelImportService.columns(sb, CONFIG_COLUMN_MAP, null, propertyConfigurationMap)
            res.each {
                dateFields.each { field ->
                    try {
                        def fff = it[field]
                        def dateParts = it[field].split("/").collect { it as Integer }
                        JalaliCalendar jc = new JalaliCalendar(dateParts[0], dateParts[1], dateParts[2])
                        def gc = jc.toJavaUtilGregorianCalendar()
                        it[field] = 'date.struct'
                        it["${field}_year"] = gc.get(Calendar.YEAR) as String
//                    def dy = it["${field}_year"]
                        it["${field}_month"] = gc.get(Calendar.MONTH) + 1 as String
//                    def dm = it["${field}_month"] +1
                        it["${field}_day"] = gc.get(Calendar.DATE) as String
//                    def dd = it["${field}_day"]
//                    def dd2 = it["${field}_day"]
                    } catch (x) { x.printStackTrace() }
                }

                Contract contract = new Contract(it)
                contract.importDate = new Date()
                def oldContract = Contract.findByContractNoAndContractPartNo(contract.contractNo, contract.contractPartNo)
                if (oldContract) {
                    oldContract.settlementDate = contract.settlementDate
                    oldContract.save()

                } else {
                    try {
                        customer1 = null
                        customer1 = Customer.findByCode(contract.customerCode) ?: new Customer(code: contract.customerCode,
                                description: contract.customerDesc,
                                username: "client" + contract.customerCode,
                                password: "pass" + contract.customerCode,
                                enabled: false).save()
                        if (!customer1.equals(null)) {
                            UserRole.findByUser(customer1) ?: UserRole.create(customer1, custRole)
                        }

                    } catch (Exception e) { e.printStackTrace() }
                    contract.customer = customer1

                    try {
                        broker1 = null
                        broker1 = Broker.findByCodeAndBrokerType(contract.buyerBrokerCode, "BuyerBroker") ?: new Broker(code: contract.buyerBrokerCode,
                                description: contract.buyerBrokerDesc,
                                username: "broker" + contract.buyerBrokerCode,
                                password: "pass" + contract.buyerBrokerCode,
                                brokerType: "BuyerBroker",
                                enabled: false).save()
                        if (!broker1.equals(null)) {
                            UserRole.findByUser(broker1) ?: UserRole.create(broker1, bbRole)
                        }

                    } catch (Exception e) { e.printStackTrace() }
                    contract.buyerBroker = broker1

                    try {
                        manufacturer1 = null
                        manufacturer1 = Manufacturer.findByCode(contract.supplierCode) ?: new Manufacturer(code: contract.supplierCode,
                                description: contract.manufacturerDesc,
                                username: "producer" + contract.supplierCode,
                                password: "pass" + contract.supplierCode,
                                draftNoSequence: "1",
                                enabled: false).save()
                        if (!broker1.equals(null)) {
                            UserRole.findByUser(manufacturer1) ?: UserRole.create(manufacturer1, manRole)
                        }

                    } catch (Exception e) { e.printStackTrace() }
                    contract.manufacturer = manufacturer1

                    try {
                        supplier1 = null
                        supplier1 = Supplier.findByCode(contract.supplierCode) ?: new Supplier(code: contract.supplierCode,
                                description: contract.manufacturerDesc,
                                username: "supplier" + contract.supplierCode,
                                password: "pass" + contract.supplierCode,
                                enabled: false).save()
                        if (!broker1.equals(null)) {
                            UserRole.findByUser(supplier1) ?: UserRole.create(supplier1, supRole)
                        }

                    } catch (Exception e) { e.printStackTrace() }
                    contract.supplier = supplier1

                    contract.save()
                    phaseService.addDefaultPhases(contract)

                }

            }

            redirect(action: "list")
        }
        catch (e) {
//        else{
            e.printStackTrace()
            redirect(action: "importExcel")
        }
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

    def printContract() {
        def model = [:]

        def contract = Contract.findById(params.id)
        model.contractInstance = contract

        model.customer = Customer.findByCode(contract.customerCode)

//        model.draftNo = contract.drafts?.sort { -it.id }?.find { true }?.description
        model.draftNo = contract.drafts?.description
        model.draftDate = contract.drafts?.uploadDate
        def df = new DecimalFormat("###,###,###,###,###")
        model.quantity = df.format(Integer.valueOf(contract.quantity))
        model.price = df.format(Integer.valueOf(contract.price))

        model.addedTax = df.format(Math.round(0.06 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)))
        def feesNo = Math.round(0.00048 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)) + Math.round(0.0018 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)) + Math.round(0.0005 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity))
        def contractValueNo = Math.round(1.00 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity))
        model.shareSeller = df.format(contractValueNo - feesNo)
        model.fees = df.format(feesNo)
        model.contractValue = df.format(contractValueNo)

//        model.manufacturer = Manufacturer.findByCode(contract.supplierCode)

//            render(template: 'printContract', model: [contractInstance: contract, customer: customer, addedTax: addedTax, fees: fees])
        return model
    }


    def printIranco() {
        def model = [:]
        def user

        def contract = Contract.findById(params.id)
        if (!contract.letterNo) {
            def cal = Calendar.getInstance()
            cal.setTime(new Date())
            def jc = new JalaliCalendar(cal)
            def letterDate = jc.year.toString().substring(2) + "${jc.month}".padLeft(2,'0')

            def princ = springSecurityService.getPrincipal()
            if (princ instanceof GrailsUser) {
                user = User.findByUsername(princ.username)
            }
            if (user instanceof Broker && !user.iralcoDate.equals(letterDate)) {
                user.iralcoDate = letterDate
                user.iralcoSeq = 0
            }
            user.iralcoSeq = user.iralcoSeq + 1
            user.save()

            def letterNo = "${user.iralcoSeq}".padLeft(3, '0')

            contract.letterNo = letterDate + "/" + letterNo
            contract.save()
        }

        model.contractInstance = contract
        model.customer = Customer.findByCode(contract.customerCode)
        model.draftNo = contract.drafts?.description
        model.draftDate = contract.drafts?.uploadDate
        def df = new DecimalFormat("###,###,###,###,###")
        model.today = new Date()
        model.quantity = df.format(Integer.valueOf(contract.quantity))
        model.price = df.format(Integer.valueOf(contract.price))
        model.addedTax = df.format(Math.round(0.06 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)))
        def feesNo = Math.round(0.00048 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)) + Math.round(0.0018 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)) + Math.round(0.0005 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity))
        def contractValueNo = Math.round(1.00 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity))
        model.shareSeller = df.format(contractValueNo - feesNo)
        model.fees = df.format(feesNo)
        model.contractValue = df.format(contractValueNo)

        return model
    }

    def printRemitSales() {
        def model = [:]

        def contract = Contract.findById(params.id)
        model.contractInstance = contract

//        model.customer = Customer.findByCode(contract.customerCode)

        model.draftNo = contract.drafts?.description
        model.draftDate = contract.drafts?.uploadDate
        def df = new DecimalFormat("###,###,###,###,###")
        model.quantity = df.format(Integer.valueOf(contract.quantity))
        model.price = df.format(Integer.valueOf(contract.price))

        model.addedTax = df.format(Math.round(0.06 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)))
        def feesNo = Math.round(0.00048 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity) + 0.0018 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity) + 0.0005 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity))
        def contractValueNo = 1.00 * Integer.valueOf(contract.price) * Integer.valueOf(contract.quantity)
        model.shareSeller = df.format(contractValueNo - feesNo)
        model.fees = df.format(feesNo)
        model.contractValue = df.format(contractValueNo)

//        model.manufacturer = Manufacturer.findByCode(contract.supplierCode)

        return model

    }

    def saveFreight() {
        def contract = Contract.get(params.contractId)

        contract.freight = params.description
        contract.placeOfUnloading = params.placeOfUnloading

        if (contract.save())
            render 0;

    }

    def freightForm() {
        def contractInstance
        if (params.contractId) {
            contractInstance = Contract.get(params.contractId)
            render(template: 'freightForm', model: [contractInstance: contractInstance])
        }
    }

    def saveAddedTaxReceipt() {
        def contract = Contract.get(params.contractId)

        contract.addedTaxReceipt = params.addedTaxReceipt
        contract.addedTaxReceiptDate = params.addedTaxReceiptDate

        if (contract.save())
            render 0;

    }

    def addedTaxReceiptForm() {
        def contractInstance
        if (params.contractId) {
            contractInstance = Contract.get(params.contractId)
            render(template: 'addedTaxReceiptForm', model: [contractInstance: contractInstance])
        }
    }

    def xml() {
        def status = params.id
        def dealerBrokerCode = params.dealerBrokerCode
        def princ = springSecurityService.getPrincipal()
        def eqString = ""
        def userType
        User user
        if (princ instanceof GrailsUser) {
            user = User.findByUsername(princ.username)
            if (user instanceof Broker) {
                if (user.brokerType == "BuyerBroker") {
                    userType = "BuyerBroker"
                    eqString = "buyerBrokerCode"
                } else if (user.brokerType == "DealerBroker") {
                    userType = "DealerBroker"
                    eqString = "dealerBrokerCode"
                }
            } else if (user instanceof Customer) {
                eqString = "customerCode"
            } else if (user instanceof Supplier) {
                userType = "Supplier"
                eqString = "supplierCode"
            } else if (user instanceof Manufacturer) {
                userType = "Manufacturer"
                eqString = "supplierCode"
            }
        }

        def criteria = {

            eq(eqString, user.code)
            switch (status) {
                case "w1":
                    createAlias "phases", "m"
                    eq "m.status", "Waiting"
                    eq "m.phase", userType
                    break
                case "w2":
                    createAlias "phases", "m"
                    eq "m.status", "Waiting"
                    ne "m.phase", "DealerBroker"
                    break
                case "m":
                    createAlias "phases", "m"
                    eq "m.phase", "Finished"
                    break
                case "a":
                    isNotEmpty "amendments"
                    break
                case "c":
                    createAlias "phases", "m"
                    eq "m.status", "Cancel"
                    eq "m.phase", "BuyerBroker"
                    break
            }
        }

//        def collection
        def list = []
        def results = Contract.withCriteria(criteria)
        results.each {
            def contractReport = new ContractReport()

            contractReport.contractNo = it.contractNo
            contractReport.contractPartNo = it.contractPartNo
            contractReport.contractDate = formatDate(it.contractDate)
            contractReport.buyerBrokerDesc = it.buyerBrokerDesc
            contractReport.dealerBrokerDesc = it.dealerBrokerDesc
            contractReport.customerDesc = it.customerDesc
            contractReport.manufacturerDesc = it.manufacturerDesc
            contractReport.supplierCode = it.supplierCode
            contractReport.productSymbol = it.productSymbol
            contractReport.lastPhase = it.phases?.sort { -it.id }?.find { true }?.phase
            contractReport.draftNo = it.drafts?.description
            contractReport.allotmentDate = formatDate(it.allotmentDate)
            contractReport.settlementDeadline = formatDate(it.settlementDeadline)
            contractReport.settlementType = it.settlementType
            contractReport.productDesc = it.productDesc
            contractReport.totalShipments = it.totalShipments
            contractReport.price = it.price
            contractReport.contractType = it.contractType
            contractReport.deliveryDate = formatDate(it.deliveryDate)
            contractReport.deliveryPlace = it.deliveryPlace
            contractReport.productMainGroup = it.productMainGroup
            contractReport.productGroup = it.productGroup
            contractReport.productSubGroup = it.productSubGroup
            contractReport.weight = it.weight
            contractReport.quantity = it.quantity
            contractReport.buyerBrokerCode = it.buyerBrokerCode
            contractReport.dealerBrokerCode = it.dealerBrokerCode
            contractReport.customerCode = it.customerCode
            contractReport.boursePrice = it.boursePrice
            contractReport.settlementDate = formatDate(it.settlementDate)
            contractReport.contractID = it.contractID
            contractReport.freight = it.freight
            contractReport.placeOfUnloading = it.placeOfUnloading
            contractReport.addedTaxReceipt = it.addedTaxReceipt
            contractReport.addedTaxReceiptDate = formatDate(it.addedTaxReceiptDate)
            contractReport.customerAddress = it.customer.address
            contractReport.customerBusinessId = it.customer.businessId
            contractReport.customerNId = it.customer.nId
            contractReport.customerPhoneNo = it.customer.phoneNo
            contractReport.customerPostalCode = it.customer.postalCode
            contractReport.manufacturerAddress = it.manufacturer.address
            contractReport.manufacturerBusinessId = it.manufacturer.businessId
            contractReport.manufacturerFax = it.manufacturer.fax
            contractReport.manufacturerPhoneNo = it.manufacturer.phoneNo
            contractReport.manufacturerPostalCode = it.manufacturer.postalCode
            contractReport.releaseDate = formatDate(it.releaseDate)
            contractReport.importDate = formatDate(it.importDate)
//            contractReport.draftNo = it.drafts.description
            try {
                if (it.drafts.description)
                    contractReport.draftNo = it.drafts.description
            } catch (Exception) {

            }
            list << contractReport
        }
        try {
//        def collection = contractPhaseReportService.completeReport(params).list

            def process = { binding, element, name ->
                if (element[name] instanceof Collection) {
                    element[name].each { n ->
                        binding."$name"(n)
                    }
                } else if (element[name]) {
                    binding."$name"(element[name])
                }
            }

            def xmlRep = XmlUtil.serialize(new StreamingMarkupBuilder().with { builder ->
                builder.bind { binding ->
                    contractList {
                        list.each { e ->
                            contract {
                                process(binding, e, 'contractNo')
                                process(binding, e, 'contractPartNo')
                                process(binding, e, 'contractDate')
                                process(binding, e, 'allotmentDate')
                                process(binding, e, 'settlementDeadline')
                                process(binding, e, 'settlementType')
                                process(binding, e, 'buyerBrokerDesc')
                                process(binding, e, 'dealerBrokerDesc')
                                process(binding, e, 'customerDesc')
                                process(binding, e, 'productSymbol')
                                process(binding, e, 'productDesc')
                                process(binding, e, 'totalShipments')
                                process(binding, e, 'price')
                                process(binding, e, 'contractType')
                                process(binding, e, 'deliveryDate')
                                process(binding, e, 'manufacturerDesc')
                                process(binding, e, 'deliveryPlace')
                                process(binding, e, 'productMainGroup')
                                process(binding, e, 'productGroup')
                                process(binding, e, 'weight')
                                process(binding, e, 'quantity')
                                process(binding, e, 'buyerBrokerCode')
                                process(binding, e, 'dealerBrokerCode')
                                process(binding, e, 'customerCode')
                                process(binding, e, 'supplierCode')
                                process(binding, e, 'boursePrice')
                                process(binding, e, 'settlementDate')
                                process(binding, e, 'contractID')
                                process(binding, e, 'releaseDate')
                                process(binding, e, 'importDate')
                                process(binding, e, 'draftNo')
                                process(binding, e, 'freight')
                                process(binding, e, 'placeOfUnloading')
                                process(binding, e, 'addedTaxReceipt')
                                process(binding, e, 'addedTaxReceiptDate')
                                process(binding, e, 'customerAddress')
                                process(binding, e, 'customerBusinessId')
                                process(binding, e, 'customerNId')
                                process(binding, e, 'customerPhoneNo')
                                process(binding, e, 'customerPostalCode')
                                process(binding, e, 'manufacturerAddress')
                                process(binding, e, 'manufacturerBusinessId')
                                process(binding, e, 'manufacturerFax')
                                process(binding, e, 'manufacturerPhoneNo')
                                process(binding, e, 'manufacturerPostalCode')
                            }
                        }
                    }
                }
            })


            def stringWriter = new StringWriter()
            def node = new XmlParser().parseText(xmlRep)
            def printer = new XmlNodePrinter(new PrintWriter(stringWriter))

            printer.preserveWhitespace = true
            printer.print(node)

            def newXml = stringWriter.toString().trim()

            // The actual file download. This approach actually calls the save dialog of the browser.
            byte[] byteArr = newXml.getBytes("UTF-8")


            response.setHeader("Content-disposition", "attachment; filename=report.xml")
//            response.setHeader("Content-Length", "${byteArr.length}")
            response.contentType = "text/xml"
            response.outputStream << byteArr
            response.outputStream.flush()

        } catch (Exception e) {
            e.printStackTrace()
        }

    }

    private def formatDate(date) {
        try {
            if (date) {
                def cal = Calendar.getInstance()
                cal.setTime(date)

                def jc = new JalaliCalendar(cal)

                return String.format("%04d/%02d/%02d", jc.getYear(), jc.getMonth(), jc.getDay())
            }
        } catch (e) {}
        return ""

    }

}
