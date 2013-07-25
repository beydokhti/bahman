package bahman

class Contract {
    String contractPartNo
    String contractNo
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
    String freight
    String placeOfUnloading
    String addedTaxReceipt
    Date addedTaxReceiptDate
    Customer customer
    Manufacturer manufacturer
    Broker buyerBroker
    Supplier supplier
    Draft drafts
    static hasMany = [attachments:Attachment,
            phases:Phase,
            amendments:Amendment]

    static constraints = {
        prevStatus()
        contractNo (nullable:false,blank:false,maxSize: 50,unique: "contractPartNo")
        contractPartNo (nullable:false,blank:false,maxSize: 50)
        buyerBrokerDesc (nullable:false,maxSize: 200)
        dealerBrokerDesc (nullable:false,maxSize: 200)
        customerDesc (nullable:false,maxSize: 200)
        contractDate (nullable:false)
        allotmentDate (nullable:false)
        settlementDeadline (nullable:false)
        settlementType (nullable:true,maxSize: 50)
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
        settlementDate (nullable:true)
        contractID (nullable:false,maxSize: 50)
        releaseDate (nullable:false)
        freight(nullable: true,maxSize: 100)
        placeOfUnloading(nullable: true,maxSize: 500)
        addedTaxReceipt(nullable: true,maxSize: 50)
        addedTaxReceiptDate(nullable: true)
        importDate (nullable:false)
        customer(nullable: true)
        manufacturer(nullable: true)
        supplier(nullable: true)
        buyerBroker(nullable: true)
        drafts (nullable: true)
        attachments (nullable: true)
        phases(nullable: true)
        lastPhase()
    }
    static def findByPhase (Contract contract){
        for (p in contract.phases)
        {
            if (p.status=='Waiting')
                return p.id
        }
        return 0
    }

    static def findByPhaseStatus (Contract contract,String phase){
        def phaseTemp =""
        for (p in contract.phases.sort())
        {
            if (p.phase==phase)
                phaseTemp= p.status
        }
        return phaseTemp
    }

    transient def getLastPhase(){
        if (this.phases) {
                for (p in this?.phases)
            {
                if (p.status=='Waiting')
                    return p.phase
            }
    }
        return ""
    }


    transient def getPrevStatus(){
        def today=new Date()
        def phaseCount=0
        if (this.phases){
            String oldPhase="Pass"
            String lastStatus=""
            for (p in this?.phases?.sort{it.id})
            {
                if (p.status=='Waiting')
                {
                    phaseCount++
                    break
                }
                else
                    oldPhase=p.status
            }
            if (oldPhase=="Pass")
                if (settlementDeadline<today && phaseCount<2){
                    return "Expired"
                }else{
                    return "New"
                }
            else if (oldPhase=="Reject")
                return "Failed"
        }
    }
}