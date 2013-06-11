package bahman

import bahman.report.ContractReport
import fi.joensuu.joyds1.calendar.JalaliCalendar
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser

import java.text.SimpleDateFormat

class ContractPhaseReportService {
    def springSecurityService

    def report(params) {

        def c = Contract.createCriteria()
        def list = []
        def format = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
        Date contractDateFrom
        Date contractDateTo


            println(params.contractDateFrom?:"")
            if (params.contractDateFrom) {
                def dateFrom = params.contractDateFrom
                if (dateFrom instanceof Date)
                    contractDateFrom = params.contractDateFrom
                else {
                    contractDateFrom = format.parse(dateFrom)
                }
            }

            if (params.contractDateTo)
            {
                def dateTo = params.contractDateTo
                if (dateTo instanceof Date)
                    contractDateTo = params.contractDateTo
                else {

                    contractDateTo = format.parse(dateTo)
                }

            }

        Date importDateFrom
        Date importDateTo

            if (params.importDateFrom)
            {
                def iDateFrom = params.importDateFrom
                if (iDateFrom instanceof Date)
                    importDateFrom = params.importDateFrom
                else {
                    importDateFrom = format.parse(iDateFrom)
                }

            }
            if (params.importDateTo){
                def iDateTo = params.importDateTo
                if (iDateTo instanceof Date)
                    importDateTo = params.importDateTo
                else {
                    importDateTo = format.parse(iDateTo)
                }
            }

        def princ = springSecurityService.getPrincipal()
        //////////////
        def p=params.customerDesc

        def results = c.list {
            and {
                if (params.contractNoFrom && params.contractNoTo)
                    between("contractNo", params.contractNoFrom, params.contractNoTo)
                if (params.contractPartNoFrom && params.contractPartNoTo)
                    between("contractPartNo", params.contractPartNoFrom, params.contractPartNoTo)
                if (contractDateFrom && contractDateTo)
                    between("contractDate", contractDateFrom, contractDateTo)
                if (importDateFrom && importDateTo)
                    between("importDate", contractDateFrom, contractDateTo)
                if (params.buyerBrokerCodeFrom && params.buyerBrokerCodeTo)
                    between("buyerBrokerCode", params.buyerBrokerCodeFrom, params.buyerBrokerCodeTo)
                if (params.customerCodeFrom && params.customerCodeTo)
                    between("customerCode", params.customerCodeFrom, params.customerCodeTo)
                if (params.supplierCodeFrom && params.supplierCodeTo)
                    between("supplierCode", params.supplierCodeFrom, params.supplierCodeTo)
                if (params.productSymbol)
                    eq("productSymbol",params.productSymbol)
                if (params.customerDesc)
                    eq("customerDesc",params.customerDesc)
                if (princ instanceof GrailsUser) {
                    def user = User.findByUsername(princ.username)
                    if (user instanceof Broker) {
                        if (user.brokerType == "BuyerBroker") {
                            eq("buyerBrokerCode", user.code)
                        } else if (user.brokerType == "DealerBroker") {
                            eq("dealerBrokerCode", user.code)
                        }
                    } else if (user instanceof Customer) {
                        eq("customerCode", user.code)
                    } else if (user instanceof Supplier) {
                        eq("supplierCode", user.code)
                    } else if (user instanceof Manufacturer) {
                        eq("supplierCode", user.code)
                    }
                }
            }
        }

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
            contractReport.releaseDate = formatDate(it.releaseDate)
            contractReport.importDate = formatDate(it.importDate)
            try {
                if (it.drafts.description)
                    contractReport.draftNo = it.drafts.description
            } catch (Exception) {

            }
            list << contractReport
        }

        def userdata = [:]
        [list: list, userdata: userdata]
    }

    def completeReport(params) {

        def c = Contract.createCriteria()
        def list = []
        def format = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
        Date contractDateFrom
        Date contractDateTo


        println(params.contractDateFrom?:"")
        if (params.contractDateFrom) {
            def dateFrom = params.contractDateFrom
            if (dateFrom instanceof Date)
                contractDateFrom = params.contractDateFrom
            else {
                contractDateFrom = format.parse(dateFrom)
            }
        }

        if (params.contractDateTo)
        {
            def dateTo = params.contractDateTo
            if (dateTo instanceof Date)
                contractDateTo = params.contractDateTo
            else {

                contractDateTo = format.parse(dateTo)
            }

        }

        Date importDateFrom
        Date importDateTo

        if (params.importDateFrom)
        {
            def iDateFrom = params.importDateFrom
            if (iDateFrom instanceof Date)
                importDateFrom = params.importDateFrom
            else {
                importDateFrom = format.parse(iDateFrom)
            }

        }
        if (params.importDateTo){
            def iDateTo = params.importDateTo
            if (iDateTo instanceof Date)
                importDateTo = params.importDateTo
            else {
                importDateTo = format.parse(iDateTo)
            }
        }

        def princ = springSecurityService.getPrincipal()
        //////////////
        def p=params.customerDesc

        def results = c.list {
            and {
                if (params.contractNoFrom && params.contractNoTo)
                    between("contractNo", params.contractNoFrom, params.contractNoTo)
                if (params.contractPartNoFrom && params.contractPartNoTo)
                    between("contractPartNo", params.contractPartNoFrom, params.contractPartNoTo)
                if (contractDateFrom && contractDateTo)
                    between("contractDate", contractDateFrom, contractDateTo)
                if (importDateFrom && importDateTo)
                    between("importDate", contractDateFrom, contractDateTo)
                if (params.buyerBrokerCodeFrom && params.buyerBrokerCodeTo)
                    between("buyerBrokerCode", params.buyerBrokerCodeFrom, params.buyerBrokerCodeTo)
                if (params.customerCodeFrom && params.customerCodeTo)
                    between("customerCode", params.customerCodeFrom, params.customerCodeTo)
                if (params.supplierCodeFrom && params.supplierCodeTo)
                    between("supplierCode", params.supplierCodeFrom, params.supplierCodeTo)
                if (params.productSymbol)
                    eq("productSymbol",params.productSymbol)
                if (params.customerDesc)
                    eq("customerDesc",params.customerDesc)
                if (princ instanceof GrailsUser) {
                    def user = User.findByUsername(princ.username)
                    if (user instanceof Broker) {
                        if (user.brokerType == "BuyerBroker") {
                            eq("buyerBrokerCode", user.code)
                        } else if (user.brokerType == "DealerBroker") {
                            eq("dealerBrokerCode", user.code)
                        }
                    } else if (user instanceof Customer) {
                        eq("customerCode", user.code)
                    } else if (user instanceof Supplier) {
                        eq("supplierCode", user.code)
                    } else if (user instanceof Manufacturer) {
                        eq("supplierCode", user.code)
                    }
                }
            }
        }

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
            contractReport.manufacturerAddress=it.manufacturer.address
            contractReport.manufacturerBusinessId=it.manufacturer.businessId
            contractReport.manufacturerFax=it.manufacturer.fax
            contractReport.manufacturerPhoneNo=it.manufacturer.phoneNo
            contractReport.manufacturerPostalCode=it.manufacturer.postalCode
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

        def userdata = [:]
        [list: list, userdata: userdata]
    }

//
//    def queryReport(params) {
//        def c = Contract.createCriteria()
//        def list = []
//        Date contractDateFrom
//        Date contractDateTo
//
//
//        try {
//            if (params.contractDateFrom)
//                contractDateFrom = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
//                        .parse(params.contractDateFrom)
//
//            if (params.contractDateTo)
//                contractDateTo = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
//                        .parse(params.contractDateTo)
//        } catch (Exception e) {}
//
//        Date importDateFrom
//        Date importDateTo
//        try {
//            if (params.importDateFrom)
//                importDateFrom = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
//                        .parse(params.importDateFrom)
//
//            if (params.importDateTo)
//                importDateTo = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
//                        .parse(params.importDateTo)
//        } catch (Exception e) {}
//        /////////////
//        def princ = springSecurityService.getPrincipal()
//        //////////////
//        def p=params.customerDesc
//
//        def results = c.list {
//            and {
//                if (params.contractNoFrom && params.contractNoTo)
//                    between("contractNo", params.contractNoFrom, params.contractNoTo)
//                if (params.contractPartNoFrom && params.contractPartNoTo)
//                    between("contractPartNo", params.contractPartNoFrom, params.contractPartNoTo)
//                if (contractDateFrom && contractDateTo)
//                    between("contractDate", contractDateFrom, contractDateTo)
//                if (importDateFrom && importDateTo)
//                    between("importDate", contractDateFrom, contractDateTo)
//                if (params.buyerBrokerCodeFrom && params.buyerBrokerCodeTo)
//                    between("buyerBrokerCode", params.buyerBrokerCodeFrom, params.buyerBrokerCodeTo)
//                if (params.customerCodeFrom && params.customerCodeTo)
//                    between("customerCode", params.customerCodeFrom, params.customerCodeTo)
//                if (params.supplierCodeFrom && params.supplierCodeTo)
//                    between("supplierCode", params.supplierCodeFrom, params.supplierCodeTo)
//                if (params.productSymbol)
//                    eq("productSymbol",params.productSymbol)
//                if (params.customerDesc)
//                    eq("customerDesc",params.customerDesc)
//                if (princ instanceof GrailsUser) {
//                    def user = User.findByUsername(princ.username)
//                    if (user instanceof Broker) {
//                        if (user.brokerType == "BuyerBroker") {
//                            eq("buyerBrokerCode", user.code)
//                        } else if (user.brokerType == "DealerBroker") {
//                            eq("dealerBrokerCode", user.code)
//                        }
//                    } else if (user instanceof Customer) {
//                        eq("customerCode", user.code)
//                    } else if (user instanceof Supplier) {
//                        eq("supplierCode", user.code)
//                    } else if (user instanceof Manufacturer) {
//                        eq("supplierCode", user.code)
//                    }
//                }
//            }
//        }
//
//        results.each {
//            def contractReport = new ContractReport()
//
//            contractReport.contractNo = it.contractNo
//            contractReport.contractPartNo = it.contractPartNo
//            contractReport.contractDate = formatDate(it.contractDate)
//            contractReport.buyerBrokerDesc = it.buyerBrokerDesc
//            contractReport.dealerBrokerDesc = it.dealerBrokerDesc
//            contractReport.customerDesc = it.customerDesc
//            contractReport.manufacturerDesc = it.manufacturerDesc
//            contractReport.supplierCode = it.supplierCode
//            contractReport.productSymbol = it.productSymbol
//            contractReport.lastPhase = it.phases?.sort { -it.id }?.find { true }?.phase
//            contractReport.draftNo = it.drafts?.sort { -it.id }?.find { true }?.description
//            contractReport.allotmentDate = formatDate(it.allotmentDate)
//            contractReport.settlementDeadline = formatDate(it.settlementDeadline)
//            contractReport.settlementType = it.settlementType
//            contractReport.productDesc = it.productDesc
//            contractReport.totalShipments = it.totalShipments
//            contractReport.price = it.price
//            contractReport.contractType = it.contractType
//            contractReport.deliveryDate = formatDate(it.deliveryDate)
//            contractReport.deliveryPlace = it.deliveryPlace
//            contractReport.productMainGroup = it.productMainGroup
//            contractReport.productGroup = it.productGroup
//            contractReport.productSubGroup = it.productSubGroup
//            contractReport.weight = it.weight
//            contractReport.quantity = it.quantity
//            contractReport.buyerBrokerCode = it.buyerBrokerCode
//            contractReport.dealerBrokerCode = it.dealerBrokerCode
//            contractReport.customerCode = it.customerCode
//            contractReport.boursePrice = it.boursePrice
//            contractReport.settlementDate = formatDate(it.settlementDate)
//            contractReport.contractID = it.contractID
//            contractReport.freight = it.freight
//            contractReport.releaseDate = formatDate(it.releaseDate)
//            contractReport.importDate = formatDate(it.importDate)
//            try {
//                if (it.drafts.description)
//                    contractReport.draftNo = it.drafts.description
//            } catch (Exception) {
//
//            }
//            list << contractReport
//        }
//        return list
//    }

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