package bahman.report

import bahman.ContractPhaseReportService
import org.springframework.dao.DataIntegrityViolationException
import rapidgrails.Field

class ContractReportController {
    def reportService
    def ContractPhaseReportService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
//        params.max = Math.min(params.max ? params.int('max') : 10, 100)
//        [contractReportInstanceList: ContractReport.list(params), contractReportInstanceTotal: ContractReport.count()]
    }
    def contractPhase() {
        [reportParams:params]
    }

    def showContractPhaseReport() {
        redirect(action: "contractPhase", params: params)
    }

    def pdf() {
        export("pdf")
    }

    def xls() {
        export("xls")
    }

    private def export(format) {
        def reportTitle = "Contract"
        def subTitle = "Details"

        def fields = []

        fields << Field.String(name: "contractNo")
        fields << Field.String(name: "contractPartNo")
        fields << Field.String(name: "lastPhase")
        fields << Field.String(name: "contractDate")
        fields << Field.String(name: "allotmentDate")
        fields << Field.String(name: "settlementDeadline")
        fields << Field.String(name: "settlementType")
        fields << Field.String(name: "buyerBrokerDesc")
        fields << Field.String(name: "dealerBrokerDesc")
        fields << Field.String(name: "customerDesc")
        fields << Field.String(name: "productSymbol")
        fields << Field.String(name: "productDesc")
        fields << Field.String(name: "totalShipments")
        fields << Field.String(name: "price")
        fields << Field.String(name: "contractType")
        fields << Field.String(name: "deliveryDate")
        fields << Field.String(name: "manufacturerDesc")
        fields << Field.String(name: "deliveryPlace")
        fields << Field.String(name: "productMainGroup")
        fields << Field.String(name: "productGroup")
        fields << Field.String(name: "productSubGroup")
        fields << Field.String(name: "weight")
        fields << Field.String(name: "quantity")
        fields << Field.String(name: "buyerBrokerCode")
        fields << Field.String(name: "dealerBrokerCode")
        fields << Field.String(name: "customerCode")
        fields << Field.String(name: "supplierCode")
        fields << Field.String(name: "boursePrice")
        fields << Field.String(name: "settlementDate")
        fields << Field.String(name: "contractID")
        fields << Field.String(name: "releaseDate")
        fields << Field.String(name: "importDate")
        fields << Field.String(name: "draftNo")


        def columns = fields.collect {it.title}.toArray(new String[0])

        reportService.CreateReportFile(reportTitle, subTitle, fields,ContractPhaseReportService.report (params).list, columns, format, response, request, true)
    }
}

