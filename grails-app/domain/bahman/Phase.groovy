package bahman

class Phase {
    String phase
    String comment
    Organization organization
    String status
    Date startDate
    Date endDate

    static constraints = {
        status(inList: ["O", "N", "W"]) //ok-nok-waiting
        phase(nullable: false,blank: false, inList: ["DealerBroker","BuyerBroker","Supplier","Manufacturer","Finished"])
        comment(nullable: true,maxSize: 1024)
        startDate(nullable: false)
        endDate(nullable: true)
        organization(nullable: false,maxSize: 50)
    }
    String toString(){
    "$phase"
    }
}