package bahman

//import org.apache.poi.hssf.model.Workbook

import java.text.SimpleDateFormat

class SearchAllReportService {

    def report(params) {
        def results= queryReport(params)
        def userdata = [:]
//        userdata.totalShipments = "131313"
//        userdata.valueAfterCashFlow="Yearly MWRR=%${String.format("%.2f", 100.0 * YMWRR)}"
        [list: results, userdata: userdata]
    }

    def queryReport (params){
        def c = Contract.createCriteria()
        def dd= params.buyerBrokerCodeFrom
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
//            maxResults(10)
        }
        return results
    }
    def excelExport(params) {
        def file = createReport(queryReport(params))

        response.setHeader('Content-disposition', 'attachment;filename=Report.xls')
        response.setHeader('Content-length', "${file.size()}")

        OutputStream out = new BufferedOutputStream(response.outputStream)

        try {
            out.write(file.bytes)

        } finally {
            out.close()
            return false
        }
    }

    private File createReport(def list) {
//        WorkbookSettings workbookSettings = new WorkbookSettings()
//        workbookSettings.locale = Locale.default
//
//        def file = File.createTempFile('myExcelDocument', '.xls')
//        file.deleteOnExit()
//
//        WritableWorkbook workbook = Workbook.createWorkbook(file, workbookSettings)
//
//        WritableFont font = new WritableFont(WritableFont.ARIAL, 12)
//        WritableCellFormat format = new WritableCellFormat(font)
//
//        def row = 0
//        WritableSheet sheet = workbook.createSheet('MySheet', 0)
//
//        list.each {
//            // if list contains objects with 'foo' and 'bar' properties, this will
//            // output one row per list item, with column A containing foo and column
//            // B containing bar
//            sheet.addCell(new Label(0, row, it.foo, format))
//            sheet.addCell(new Label(1, row++, it.bar, format))
//        }
    }
}

