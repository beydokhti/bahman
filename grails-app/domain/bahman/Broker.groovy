package bahman

class Broker extends Organization{
    static hasMany = [brokerRoles:BrokerRole]
    static constraints = {
    }
}
