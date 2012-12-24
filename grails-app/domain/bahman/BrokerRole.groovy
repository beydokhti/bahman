package bahman

class BrokerRole {
    String roleName
    static constraints = {
        roleName(blank: false)
    }
}
