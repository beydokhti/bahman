package bahman

import fi.joensuu.joyds1.calendar.JalaliCalendar
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.grails.plugins.excelimport.ExpectedPropertyType
import org.springframework.dao.DataIntegrityViolationException


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
        if (params.id){
        def contract = Contract.findById( params.id )
        def princ = springSecurityService.getPrincipal()
        def code=""
        def desc=""

        if (princ instanceof GrailsUser && contract) {
            def user = User.findByUsername(princ.username)

            if (user instanceof Broker ) {
                def subRoleB = SubRole.findByRoleName("Dealer")
                def dealer =UserRole.findByUserAndSubRoles(user,subRoleB)
                if (!dealer ){
                    code = contract.buyerBrokerCode
                }
                else if (dealer){
                    code = contract.dealerBrokerCode
                }
            }

            else if (user instanceof Customer){
                code = contract.customerCode
            }
            else if(user instanceof Supplier){
                code = contract.supplierCode
            }
            else if(user instanceof Manufacturer){
                desc = contract.manufacturerDesc
            }
            if (user.code==code || user.description==desc){
                return [ contractInstance : contract ]
            }

        }
        }
    }

    def showPhase = {
        if (params.id){
            def contract = Contract.findById( params.id )
            def princ = springSecurityService.getPrincipal()
            def code=""
            def desc=""

            if (princ instanceof GrailsUser && contract) {
                def user = User.findByUsername(princ.username)

                if (user instanceof Broker ) {
                    def subRoleB = SubRole.findByRoleName("Dealer")
                    def dealer =UserRole.findByUserAndSubRoles(user,subRoleB)
                    if (!dealer ){
                        code = contract.buyerBrokerCode
                    }
                    else if (dealer){
                        code = contract.dealerBrokerCode
                    }
                }

                else if (user instanceof Customer){
                    code = contract.customerCode
                }
                else if(user instanceof Supplier){
                    code = contract.supplierCode
                }
                else if(user instanceof Manufacturer){
                    desc = contract.manufacturerDesc
                }
                if (user.code==code || user.description==desc){
                    [ contractInstance : contract ]
                }

            }
        }
    }
    def list() {
        def princ = springSecurityService.getPrincipal()
        if (princ instanceof GrailsUser) {
            def user = User.findByUsername(princ.username)
            if (user instanceof Broker ) {
                def subRoleB = SubRole.findByRoleName("Dealer")
                def dealer =UserRole.findByUserAndSubRoles(user,subRoleB)
                if (!dealer ){
                    redirect(action: "buyerBroker", params: params)
                }
               else if (dealer){
                    redirect(action: "dealerBroker", params: params)
                }
            }

        else if (user instanceof Customer){
             redirect(action: "Customer", params: params)
        }
        else if(user instanceof Supplier){
            redirect(action: "Supplier", params: params)
        }
        else if(user instanceof Manufacturer){
            redirect(action: "Manufacturer", params: params)
        }
        }

        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contractInstanceList: Contract.list(params), contractInstanceTotal: Contract.count()]
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
    def Customer() {
        def princ = springSecurityService.getPrincipal()

        def user = User.findByUsername(princ.username)

        [customer: user]

    }
    def Supplier() {
        def princ = springSecurityService.getPrincipal()

        def user = User.findByUsername(princ.username)

        [organization: user]

    }
    def Manufacturer() {
        def princ = springSecurityService.getPrincipal()

        def user = User.findByUsername(princ.username)

         [organization: user]

    }
    def save = {
        def contract = new Contract(params)
        if(!contract.hasErrors() && contract.save()) {
            flash.message = "TekEvent ${contract.id} created"
            phaseService.addDefaultPhases(contract)
        }
    }


//    def edit = {
//        def contractInstance = Contract.findById( params.id )
//        if(contractInstance) {
//            return [ contractInstance : contractInstance ]
//        }
//    }
    def getImage() {
        if (params.id) {
            def attachment = Attachment.get(params.id)
            response.contentType = 'image/png'
            response.outputStream << attachment.document
            response.outputStream.flush()
        }
    }
    def editAttachmentPhase={
       def contractInstance=Contract.get(params.id)
       if(!contractInstance){
          return
       }
        //def lll=contractInstance.phases?.find(it?.status=="W")
        def lastPhaseId =Contract.findByPhase(contractInstance)
        def lastPhase=Phase.get(lastPhaseId)
        [contractInstance: contractInstance,lastPhase:lastPhase]
    }

    def importExcel(){

    }

    def upload() {
        def file = request.getFile('file')
        def fileIs = new ByteArrayInputStream(file.bytes)
        Map CONFIG_COLUMN_MAP = [
                sheet: 'Sheet1',
                startRow: 2,
                columnMap: [
                        'B': 'contractNo',
                        'C': 'contractPartNo',
                        'D': 'contractDate',
                        'E': 'allotmentDate',
                        'F': 'settlementDeadline',
                        'G': 'settlementType',
                        'H': 'buyerBrokerDesc',
                        'I': 'dealerBrokerDesc',
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
        Workbook sb = new XSSFWorkbook(fileIs)
        def dateFields = ["contractDate", "allotmentDate", "settlementDeadline", "deliveryDate", "settlementDate", "releaseDate"]
        def res = excelImportService.columns(sb, CONFIG_COLUMN_MAP, null, propertyConfigurationMap)
        res.each {
            dateFields.each { field ->
                def dateParts = it[field].split("/").collect {it as Integer}
                JalaliCalendar jc = new JalaliCalendar(dateParts[0], dateParts[1], dateParts[2])
                def gc = jc.toJavaUtilGregorianCalendar()
                it[field] = 'date.struct'
                it["${field}_year"] = gc.get(Calendar.YEAR) as String
                it["${field}_month"] = gc.get(Calendar.MONTH) as String
                it["${field}_day"] = gc.get(Calendar.DATE) as String
            }
            Contract contract = new Contract(it)
            contract.importDate = new Date()
            contract.save()
            phaseService.addDefaultPhases(contract)
        }

        redirect(action: "list")
    }
}
