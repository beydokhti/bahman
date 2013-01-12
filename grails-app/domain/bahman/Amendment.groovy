package bahman

class Amendment {

    Date amendmentDate
    String comment
    String contractNo
    String contractPartNo
    String dealerBroker
    String buyerBroker
    String supplier
    String manufacturer
    String finished
    String fileName
    String contentType
    byte[] amendmentDocument
    static hasMany = [phases:Phase]


    static constraints = {
        amendmentDate(nullable: false)
        amendmentDocument (nullable: true,maxSize: 5000000)
        phases(nullable: true)
        contractNo(nullable: false,maxSize:50 )
        contractPartNo(nullable: false,maxSize:50 )
        dealerBroker(nullable: false,inList: ['N','Y'])
        buyerBroker(nullable: false,inList: ['N','Y'])
        supplier(nullable: false,inList: ['N','Y'])
        manufacturer(nullable: false,inList: ['N','Y'])
        finished(nullable: false,inList: ['N','Y'])
        fileName(nullable: true,maxSize: 256)
        contentType(nullable: true,maxSize: 256)
    }
    transient def getLastPhase(){
        if (manufacturer=="Y")
            return "Manufacturer"
        else if (supplier=="Y")
            return "Supplier"
        else if (dealerBroker=="Y")
            return "DealerBroker"
        else if (buyerBroker=="Y")
            return "BuyerBroker"
    }
//    transient def getPrevStatus(){
//        def today=new Date()
//        def phaseCount=0
//        if (this.phases){
//            String oldPhase="Pass"
//            String lastStatus=""
//            for (p in this?.phases?.sort{it.id})
//            {
//                if (p.status=='Waiting')
//                {
//                    phaseCount++
//                    break
//                }
//                else
//                    oldPhase=p.status
//            }
//            if (oldPhase=="Pass")
////                if (settlementDeadline<today && phaseCount<2){
////                    return "Expired"
////                }else{
//                    return "New"
////                }
//            else if (oldPhase=="Reject")
//                return "Failed"
//        }
//    }
}
