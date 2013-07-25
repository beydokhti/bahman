package bahman

class Phase {
    String phase
    String comment
    Organization organization
    String status
    Date startDate
    Date endDate

    static constraints = {
        status(inList: ["Pass", "Reject", "Waiting","Cancel","Terminate"]) //ok-nok-waiting
        phase(nullable: false, blank: false, inList: ["DealerBroker", "BuyerBroker", "Supplier", "Manufacturer", "Finished"])
        comment(nullable: true, maxSize: 1024)
        startDate(nullable: false)
        endDate(nullable: true)
        organization(nullable: true, maxSize: 50)
        phaseName()
        statusName()
    }

    String toString() {

        "$phase"
    }

    transient getPhaseName() {
        if (phase == "BuyerBroker")
            return "کارگزار خریدار"
        else if (phase == "DealerBroker")
            return "کارگزار فروشنده"
        else if (phase == "Supplier")
            return "بازرگانی"
        else if (phase == "Manufacturer")
            return "تولید کننده"
        else if (phase == "Finished")
            return "پایان"
    }

    transient getStatusName() {
        if (status == 'Pass')
            return "تایید"
        else if (status == 'Reject')
            return "برگشت"
        else if (status == 'Waiting')
            return "درحال انتظار"
        else if (status== "Cancel")
            return "ابطال شده"
        else if (status == "Terminate")
            return "متوقف شده"

    }

    static def findByPhaseName(String phaseName) {
        if (phaseName == "BuyerBroker")
            return 0
        else if (phaseName == "DealerBroker")
            return 1
        else if (phaseName == "Supplier")
            return 2
        else if (phaseName == "Manufacturer")
            return 3
        else if (phaseName == "Finished")
            return 4
        else
            return null
    }

    static def findByPhaseLevel(Integer level) {
        def phaseList = ["BuyerBroker", "DealerBroker", "Supplier", "Manufacturer", "Finished"]
        if (level < 5 && level >= 0)
            return phaseList[level]
        else
            return ""
    }
}