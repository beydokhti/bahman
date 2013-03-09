package bahman

import bahman.report.ContractReport
import fi.joensuu.joyds1.calendar.JalaliCalendar

import java.text.SimpleDateFormat

class ContractPhaseReportService {

    def report(params) {
        def results = queryReport(params)
        def userdata = [:]
//        userdata.totalShipments = "131313"
//        userdata.valueAfterCashFlow="Yearly MWRR=%${String.format("%.2f", 100.0 * YMWRR)}"
        [list: results, userdata: userdata]
    }

    def queryReport(params) {
        def c = Contract.createCriteria()
        def list = []
        Date contractDateFrom
        if (params.contractDateFrom)
            contractDateFrom = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
                    .parse(params.contractDateFrom)
        Date contractDateTo
        if (params.contractDateTo)
            contractDateTo = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy")
                    .parse(params.contractDateTo)

        def results = c.list {
            and {
                if (params.contractNoFrom && params.contractNoTo)
                    between("contractNo", params.contractNoFrom, params.contractNoTo)
                if (params.contractPartNoFrom && params.contractPartNoTo)
                    between("contractPartNo", params.contractPartNoFrom, params.contractPartNoTo)
                if (contractDateFrom && contractDateTo)
                    between("contractDate", contractDateFrom, contractDateTo)
                if (params.buyerBrokerCodeFrom && params.buyerBrokerCodeTo)
                    between("buyerBrokerCode", params.buyerBrokerCodeFrom, params.buyerBrokerCodeTo)
                if (params.customerCodeFrom && params.customerCodeTo)
                    between("customerCode", params.customerCodeFrom, params.customerCodeTo)
                if (params.supplierCodeFrom && params.supplierCodeTo)
                    between("supplierCode", params.supplierCodeFrom, params.supplierCodeTo)
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
            contractReport.lastPhase = it.phases?.sort {-it.id}?.find {true}?.phase
            contractReport.draftNo = it.drafts?.sort {-it.id}?.find {true}?.description
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
            contractReport.releaseDate = formatDate(it.releaseDate)
            contractReport.importDate = formatDate(it.importDate)

            list << contractReport
        }
        return list
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
