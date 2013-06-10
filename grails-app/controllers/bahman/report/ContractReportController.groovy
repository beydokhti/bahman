package bahman.report

import bahman.ContractPhaseReportService
import bahman.Role
import groovy.xml.StreamingMarkupBuilder
import groovy.xml.XmlUtil
import org.springframework.dao.DataIntegrityViolationException
import rapidgrails.Field

class ContractReportController {
    def exportService
    def contractPhaseReportService

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
        fields << Field.String(name: "freight")


        def columns = fields.collect {it.title}

        def colMap =[:]
        colMap.put("contractNo",message(code:"contract.contractNo.label"))
        colMap.put("contractPartNo",message(code:"contract.contractPartNo.label"))
        colMap.put("lastPhase",message(code:"contract.lastPhase.label"))
        colMap.put("contractDate",message(code:"contract.contractDate.label"))
        colMap.put("allotmentDate",message(code:"contract.allotmentDate.label"))
        colMap.put("settlementDeadline",message(code:"contract.settlementDeadline.label"))
        colMap.put("settlementType",message(code:"contract.settlementType.label"))
        colMap.put("buyerBrokerDesc",message(code:"contract.buyerBrokerDesc.label"))
        colMap.put("dealerBrokerDesc",message(code:"contract.dealerBrokerDesc.label"))
        colMap.put("customerDesc",message(code:"contract.customerDesc.label"))
        colMap.put("productSymbol",message(code:"contract.productSymbol.label"))
        colMap.put("productDesc",message(code:"contract.productDesc.label"))
        colMap.put("totalShipments",message(code:"contract.totalShipments.label"))
        colMap.put("price",message(code:"contract.price.label"))
        colMap.put("contractType",message(code:"contract.contractType.label"))
        colMap.put("deliveryDate",message(code:"contract.deliveryDate.label"))
        colMap.put("manufacturerDesc",message(code:"contract.manufacturerDesc.label"))
        colMap.put("deliveryPlace",message(code:"contract.deliveryPlace.label"))
        colMap.put("productMainGroup",message(code:"contract.productMainGroup.label"))
        colMap.put("productGroup",message(code:"contract.productGroup.label"))
        colMap.put("productSubGroup",message(code:"contract.productSubGroup.label"))
        colMap.put("weight",message(code:"contract.weight.label"))
        colMap.put("quantity",message(code:"contract.quantity.label"))
        colMap.put("buyerBrokerCode",message(code:"contract.buyerBrokerCode.label"))
        colMap.put("dealerBrokerCode",message(code:"contract.dealerBrokerCode.label"))
        colMap.put("customerCode",message(code:"contract.customerCode.label"))
        colMap.put("supplierCode",message(code:"contract.supplierCode.label"))
        colMap.put("boursePrice",message(code:"contract.boursePrice.label"))
        colMap.put("settlementDate",message(code:"contract.settlementDate.label"))
        colMap.put("contractID",message(code:"contract.contractID.label"))
        colMap.put("releaseDate",message(code:"contract.releaseDate.label"))
        colMap.put("importDate",message(code:"contract.importDate.label"))
        colMap.put("draftNo",message(code:"contract.draftNo.label"))
        colMap.put("freight",message(code:"contract.freight.label"))



        def reportList = contractPhaseReportService.report (params).list
        println(reportList)
        response.contentType = 'application/vnd.ms-excel'
        response.setHeader("Content-disposition", "attachment; filename=report.xls")
        exportService.export("excel",response.outputStream, reportList,columns, colMap, [:],[:])

    }


    def Xml() {
        try{

        def collection = contractPhaseReportService.report(params).list

        def process = { binding, element, name ->
            if( element[ name ] instanceof Collection ) {
                element[ name ].each { n ->
                    binding."$name"( n )
                }
            }
            else if( element[ name ] ) {
                binding."$name"( element[ name ] )
            }
        }

        def xmlRep= XmlUtil.serialize( new StreamingMarkupBuilder().with { builder ->
        builder.bind { binding ->
                contractList {
                    collection.each { e ->
                        contract {
                            process( binding, e, 'contractNo' )
                            process( binding, e, 'contractPartNo' )
                            process( binding, e, 'contractDate' )
                            process( binding, e, 'allotmentDate' )
                            process( binding, e, 'settlementDeadline' )
                            process( binding, e, 'settlementType' )
                            process( binding, e, 'buyerBrokerDesc' )
                            process( binding, e, 'dealerBrokerDesc' )
                            process( binding, e, 'customerDesc' )
                            process( binding, e, 'productSymbol' )
                            process( binding, e, 'productDesc' )
                            process( binding, e, 'totalShipments' )
                            process( binding, e, 'price' )
                            process( binding, e, 'contractType' )
                            process( binding, e, 'deliveryDate' )
                            process( binding, e, 'manufacturerDesc' )
                            process( binding, e, 'deliveryPlace' )
                            process( binding, e, 'productMainGroup' )
                            process( binding, e, 'productGroup' )
                            process( binding, e, 'weight' )
                            process( binding, e, 'quantity' )
                            process( binding, e, 'buyerBrokerCode' )
                            process( binding, e, 'dealerBrokerCode' )
                            process( binding, e, 'customerCode' )
                            process( binding, e, 'supplierCode' )
                            process( binding, e, 'boursePrice' )
                            process( binding, e, 'settlementDate' )
                            process( binding, e, 'contractID' )
                            process( binding, e, 'releaseDate' )
                            process( binding, e, 'importDate' )
                            process( binding, e, 'freight' )
                        }
                    }
                }
            }
        } )


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
        }
    }

}

