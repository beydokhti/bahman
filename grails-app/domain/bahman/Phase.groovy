package bahman

class Phase {
    String phase
    String comment
    Organization organization
    String status
    Date startDate
    Date endDate

    static constraints = {
        status(inList: ["Pass", "Reject", "Waiting"]) //ok-nok-waiting
        phase(nullable: false,blank: false, inList: ["DealerBroker","BuyerBroker","Supplier","Manufacturer","Finished"])
        comment(nullable: true,maxSize: 1024)
        startDate(nullable: false)
        endDate(nullable: true)
        organization(nullable: true,maxSize: 50)
        phaseName()
        statusName()
    }
    String toString(){

    "$phase"
    }

    transient getPhaseName(){
        if (phase=="BuyerBroker")
            return "کارگزار خریدار"
        else if (phase=="DealerBroker")
            return   "کارگزار فروشنده"
        else if (phase=="Supplier")
            return "بازرگانی"
        else if (phase=="Manufacturer")
            return "تولید کننده"
        else if (phase=="Finished")
            return "پایان"
    }

    transient getStatusName(){
        if (status=='Pass')
            return "تایید"
        else if (status=='Reject')
            return "برگشت"
        else if (status=='Waiting')
            return "درحال انتظار"

    }
}