package bahman

import java.text.SimpleDateFormat

class ProductReportService {

    def report(params) {
        def results= queryReport(params)
        def userdata = [:]
//        userdata.totalShipments = "131313"
//        userdata.valueAfterCashFlow="Yearly MWRR=%${String.format("%.2f", 100.0 * YMWRR)}"
        [list: results, userdata: userdata]
    }

    def queryReport (params){
        def c = Contract.createCriteria()
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
                if (params.productSymbol)
                    like("productSymbol", params.productSymbol)
            }
        }
        return results
    }
}
