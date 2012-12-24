package bahman

class Contract {
    String contractNo
    String contractPartNo
    Date contractDate
    Date allotmentDate
    Date settlementDeadline
    String settlementType
    String buyerBrokerDesc
    String dealerBrokerDesc
    String customerDesc
    String productSymbol
    String productDesc
    String totalShipments
    String price
    String contractType
    Date deliveryDate
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
    Date settlementDate
    String contractID
    Date releaseDate
    Date importDate
    Attachment settlementCertificate
    Attachment valueAddedTax
    Attachment applicationForm
    static hasMany = [attachments:Attachment,
                      phases:Phase]

    static constraints = {
        contractNo (blank:false)
        contractPartNo (blank:false)
        contractDate (nullable:false)
        allotmentDate ()
        settlementDeadline ()
        settlementType ()
        buyerBrokerDesc ()
        dealerBrokerDesc ()
        customerDesc ()
        productSymbol ()
        productDesc ()
        totalShipments ()
        price ()
        contractType ()
        deliveryDate ()
        manufacturerDesc ()
        deliveryPlace ()
        productMainGroup ()
        productGroup ()
        productSubGroup ()
        weight ()
        quantity ()
        buyerBrokerCode ()
        dealerBrokerCode ()
        customerCode ()
        supplierCode ()
        boursePrice ()
        settlementDate ()
        contractID ()
        releaseDate ()
        importDate ()
        settlementCertificate()
        valueAddedTax()
        applicationForm()
    }
}
