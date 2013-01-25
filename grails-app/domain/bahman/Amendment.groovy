package bahman

import fi.joensuu.joyds1.calendar.chinese.MoonPhase

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
    String status
    byte[] amendmentDocument
    static hasMany = [phases: Phase]


    static constraints = {
        amendmentDate(nullable: false)
        fileName(nullable: true, maxSize: 256)
        phases(nullable: true)
        contractNo(nullable: false, maxSize: 50)
        contractPartNo(nullable: false, maxSize: 50)
        dealerBroker(nullable:true, inList: ['N', 'Y'])
        buyerBroker(nullable: true, inList: ['N', 'Y'])
        supplier(nullable: true, inList: ['N', 'Y'])
        manufacturer(nullable: true, inList: ['N', 'Y'])
        finished(nullable: true, inList: ['N', 'Y'])
        amendmentDocument(nullable: true, maxSize: 5000000)
        comment(nullable: true, maxSize: 4000, widget: 'textarea')
        contentType(nullable: true, maxSize: 256)
        status(nullable: true,maxSize: 10,inList: ['Visible','Invisible'])
    }

    transient def getLastPhase() {
        if (manufacturer == "Y")
            return "Manufacturer"
        else if (supplier == "Y")
            return "Supplier"
        else if (dealerBroker == "Y")
            return "DealerBroker"
        else if (buyerBroker == "Y")
            return "BuyerBroker"
    }

   static def findStarter(Amendment amendment){
       if(amendment.phases){
//           for (p in amendment.phases.sort()){
                return amendment.phase[1]
//           }

       }
       else{
           return ""
       }
    }

    static def findSubmit(Amendment amendment, String userType){
        def phase="-1"
        if(amendment.phases){
            for (p in amendment.phases){
                if (p.status=="Waiting" && userType==p.phase){
                    phase=p.id
                }
            }
        }
        return phase
    }
}
