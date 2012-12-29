package bahman

class Phase {
    String phase
    String comment
    String organization
    String status
    Date startDate
    Date endDate

    static constraints = {
        status(inList: ["O", "N", "W"]) //ok-nok-waiting
        phase(nullable: false,blank: false)
        comment(nullable: true,maxSize: 1024)
        startDate(nullable: false)
        endDate(nullable: true)
        organization(nullable: false,maxSize: 50)
    }
}