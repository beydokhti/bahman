package bahman

class Phase {
    String phase
    String comment
    String organaization
    String status //ok-nok-waiting
    Date startDate
    Date endDate
    static constraints = {
        status()
        phase(blank: false)
        comment()
        startDate()
        endDate()
        organaization()
    }
}
