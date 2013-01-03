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
        buyerBrokerDesc (nullable:false,maxSize: 200)
        dealerBrokerDesc (nullable:false,maxSize: 200)
        customerDesc (nullable:false,maxSize: 200)
        contractDate (nullable:false)
        allotmentDate (nullable:false)
        settlementDeadline (nullable:false)
        settlementType (nullable:false,maxSize: 50)
        productSymbol (nullable:false,maxSize: 200)
        productDesc (nullable:false,maxSize: 200)
        totalShipments (nullable:false,maxSize: 50)
        price (nullable:false,maxSize: 30)
        contractType (nullable:false,maxSize: 50)
        deliveryDate (nullable:false)
        manufacturerDesc (nullable:false,maxSize: 200)
        deliveryPlace (nullable:false,maxSize: 200)
        productMainGroup (nullable:false,maxSize: 200)
        productGroup (nullable:false,maxSize: 200)
        productSubGroup (nullable:false,maxSize: 200)
        weight (nullable:false,maxSize: 50)
        quantity (nullable:false,maxSize: 50)
        buyerBrokerCode (nullable:false,maxSize: 50)
        dealerBrokerCode (nullable:false,maxSize: 50)
        customerCode (nullable:false,maxSize: 50)
        supplierCode (nullable:false,maxSize: 50)
        boursePrice (nullable:false,maxSize: 30)
        settlementDate (nullable:false)
        contractID (nullable:false,maxSize: 50)
        releaseDate (nullable:false)
        importDate (nullable:false)
        settlementCertificate(nullable:true)
        valueAddedTax(nullable:true)
        applicationForm(nullable:true)
    }
    static def findByPhase (Contract contract){
        for (p in contract.phases)
        {
            if (p.status=='Waiting')
                return p.id
        }
        return 0
    }
}