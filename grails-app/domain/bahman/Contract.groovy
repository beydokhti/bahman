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
        contractNo (blank:false,maxSize: 50)
        contractPartNo (blank:false,maxSize: 50)
        buyerBrokerDesc (nullable:true,maxSize: 200)
        dealerBrokerDesc (nullable:true,maxSize: 200)
        customerDesc (nullable:true,maxSize: 200)
        contractDate (nullable:true)
        allotmentDate (nullable:true)
        settlementDeadline (nullable:true)
        settlementType (nullable:true,maxSize: 50)
        productSymbol (nullable:true,maxSize: 200)
        productDesc (nullable:true,maxSize: 200)
        totalShipments (nullable:true,maxSize: 50)
        price (nullable:true,maxSize: 30)
        contractType (nullable:true,maxSize: 50)
        deliveryDate (nullable:true)
        manufacturerDesc (nullable:true,maxSize: 200)
        deliveryPlace (nullable:true,maxSize: 200)
        productMainGroup (nullable:true,maxSize: 200)
        productGroup (nullable:true,maxSize: 200)
        productSubGroup (nullable:true,maxSize: 200)
        weight (nullable:true,maxSize: 50)
        quantity (nullable:true,maxSize: 50)
        buyerBrokerCode (nullable:true,maxSize: 50)
        dealerBrokerCode (nullable:true,maxSize: 50)
        customerCode (nullable:true,maxSize: 50)
        supplierCode (nullable:true,maxSize: 50)
        boursePrice (nullable:true,maxSize: 30)
        settlementDate (nullable:true)
        contractID (nullable:true,maxSize: 50)
        releaseDate (nullable:true)
        importDate (nullable:true)
        settlementCertificate(nullable:true)
        valueAddedTax(nullable:true)
        applicationForm(nullable:true)
    }
}