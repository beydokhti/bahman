package bahman

class Phase {
    String phase
    String comment
    String organization
    String status
    Date startDate
    Date endDate

    static constraints = {
        status(inList: ["OK", "NOK", "Waiting"])
        phase(blank: false)
        comment()
        startDate()
        endDate()
        organization()
    }
}
