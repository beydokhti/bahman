package bahman.report

import bahman.ContractPhaseReportService
import bahman.Role
import grails.plugin.jxl.builder.ExcelBuilder
import groovy.xml.StreamingMarkupBuilder
import groovy.xml.XmlUtil
import org.springframework.dao.DataIntegrityViolationException
import rapidgrails.Field

class ContractReportController {
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
//        def fields = []
//

        def reportList = contractPhaseReportService.report(params).list

        def renderClosure = {
            sheet('Contracts') {
                cell(0, 0, g.message(code: 'contract.contractNo.label'))
                cell(1, 0, g.message(code: 'contract.contractPartNo.label'))
                cell(2, 0, g.message(code: 'contract.lastPhase.label'))
                cell(3, 0, g.message(code: 'contract.contractDate.label'))
                cell(4, 0, g.message(code: 'contract.allotmentDate.label'))
                cell(5, 0, g.message(code: 'contract.settlementDeadline.label'))
                cell(6, 0, g.message(code: 'contract.settlementType.label'))
                cell(7, 0, g.message(code: 'contract.buyerBrokerDesc.label'))
                cell(8, 0, g.message(code: 'contract.dealerBrokerDesc.label'))
                cell(9, 0, g.message(code: 'contract.customerDesc.label'))
                cell(10, 0, g.message(code: 'contract.productSymbol.label'))
                cell(11, 0, g.message(code: 'contract.productDesc.label'))
                cell(12, 0, g.message(code: 'contract.totalShipments.label'))
                cell(13, 0, g.message(code: 'contract.price.label'))
                cell(14, 0, g.message(code: 'contract.contractType.label'))
                cell(15, 0, g.message(code: 'contract.deliveryDate.label'))
                cell(16, 0, g.message(code: 'contract.manufacturerDesc.label'))
                cell(17, 0, g.message(code: 'contract.deliveryPlace.label'))
                cell(18, 0, g.message(code: 'contract.productMainGroup.label'))
                cell(19, 0, g.message(code: 'contract.productGroup.label'))
                cell(20, 0, g.message(code: 'contract.productSubGroup.label'))
                cell(21, 0, g.message(code: 'contract.weight.label'))
                cell(22, 0, g.message(code: 'contract.quantity.label'))
                cell(23, 0, g.message(code: 'contract.buyerBrokerCode.label'))
                cell(24, 0, g.message(code: 'contract.dealerBrokerCode.label'))
                cell(25, 0, g.message(code: 'contract.customerCode.label'))
                cell(26, 0, g.message(code: 'contract.supplierCode.label'))
                cell(27, 0, g.message(code: 'contract.boursePrice.label'))
                cell(28, 0, g.message(code: 'contract.settlementDate.label'))
                cell(29, 0, g.message(code: 'contract.contractID.label'))
                cell(30, 0, g.message(code: 'contract.releaseDate.label'))
                cell(31, 0, g.message(code: 'contract.importDate.label'))
                cell(32, 0, g.message(code: 'contract.draftNo.label'))
                cell(33, 0, g.message(code: 'contract.freight.label'))

                reportList.eachWithIndex { contract, i ->
                    cell(0, i + 1, contract.contractNo)
                    cell(1, i + 1, contract.contractPartNo)
                    cell(2, i + 1, contract.lastPhase)
                    cell(3, i + 1, contract.contractDate)
                    cell(4, i + 1, contract.allotmentDate)
                    cell(5, i + 1, contract.settlementDeadline)
                    cell(6, i + 1, contract.settlementType ?: "")
                    cell(7, i + 1, contract.buyerBrokerDesc)
                    cell(8, i + 1, contract.dealerBrokerDesc)
                    cell(9, i + 1, contract.customerDesc)
                    cell(10, i + 1, contract.productSymbol)
                    cell(11, i + 1, contract.productDesc)
                    cell(12, i + 1, contract.totalShipments)
                    cell(13, i + 1, contract.price)
                    cell(14, i + 1, contract.contractType)
                    cell(15, i + 1, contract.deliveryDate)
                    cell(16, i + 1, contract.manufacturerDesc)
                    cell(17, i + 1, contract.deliveryPlace)
                    cell(18, i + 1, contract.productMainGroup)
                    cell(19, i + 1, contract.productGroup)
                    cell(20, i + 1, contract.productSubGroup)
                    cell(21, i + 1, contract.weight)
                    cell(22, i + 1, contract.quantity)
                    cell(23, i + 1, contract.buyerBrokerCode)
                    cell(24, i + 1, contract.dealerBrokerCode)
                    cell(25, i + 1, contract.customerCode)
                    cell(26, i + 1, contract.supplierCode)
                    cell(27, i + 1, contract.boursePrice)
                    cell(28, i + 1, contract.settlementDate)
                    cell(29, i + 1, contract.contractID)
                    cell(30, i + 1, contract.releaseDate)
                    cell(31, i + 1, contract.importDate)
                    cell(32, i + 1, contract.draftNo ?: "")
                    cell(33, i + 1, contract.freight ?: "")

                }
            }
        }


        def stream = new ByteArrayOutputStream()
        new ExcelBuilder().workbook(stream, renderClosure)
        response.contentType = 'application/excel'
        response.setHeader("Content-disposition", "attachment;filename=export.xls")
        response.outputStream << stream.toByteArray()
    }


    def Xml() {
        try{

        def collection = contractPhaseReportService.completeReport(params).list

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
                            process( binding, e, 'draftNo' )
                            process( binding, e, 'freight' )
                            process( binding, e, 'placeOfUnloading' )
                            process( binding, e, 'addedTaxReceipt' )
                            process( binding, e, 'addedTaxReceiptDate' )
                            process( binding, e, 'customerAddress' )
                            process( binding, e, 'customerBusinessId' )
                            process( binding, e, 'customerNId' )
                            process( binding, e, 'customerPhoneNo' )
                            process( binding, e, 'customerPostalCode' )
                            process( binding, e, 'manufacturerAddress' )
                            process( binding, e, 'manufacturerBusinessId' )
                            process( binding, e, 'manufacturerFax' )
                            process( binding, e, 'manufacturerPhoneNo' )
                            process( binding, e, 'manufacturerPostalCode' )
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
            e.printStackTrace()
        }
    }

}

