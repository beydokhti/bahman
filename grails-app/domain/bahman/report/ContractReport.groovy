package bahman.report

class ContractReport {
    String contractNo
    String contractPartNo
    String lastPhase
    String contractDate
    String allotmentDate
    String settlementDeadline
    String settlementType
    String buyerBrokerDesc
    String dealerBrokerDesc
    String customerDesc
    String productSymbol
    String productDesc
    String totalShipments
    String price
    String contractType
    String deliveryDate
    String manufacturerDesc
    String deliveryPlace
    String productMainGroup
    String productGroup
    String productSubGroup
    String weight
    String quantity
    String buyerBrokerCode
    String dealerBrokerCode
    String customerCode
    String supplierCode
    String boursePrice
    String settlementDate
    String contractID
    String releaseDate
    String importDate
    String draftNo
    String freight


    static mapWith = "none"

    static constraints = {
        contractNo ()
        contractPartNo ()
        contractDate ()
        lastPhase()
        buyerBrokerDesc ()
        dealerBrokerDesc ()
        customerDesc ()
        manufacturerDesc ()
        supplierCode ()
        productSymbol ()
        draftNo()
        allotmentDate ()
        settlementDeadline ()
        settlementType ()
        productDesc ()
        totalShipments ()
        price ()
        contractType ()
        deliveryDate ()
        deliveryPlace ()
        productMainGroup ()
        productGroup ()
        productSubGroup ()
        weight ()
        quantity ()
        buyerBrokerCode ()
        dealerBrokerCode ()
        customerCode ()
        boursePrice ()
        settlementDate ()
        contractID ()
        freight()
        releaseDate ()
        importDate ()

    }
}