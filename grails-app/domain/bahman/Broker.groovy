package bahman

class Broker extends Organization{

    String brokerType

    static constraints = {
        brokerTypeName()
        brokerType(nullable: false,inList: ["BuyerBroker","DealerBroker"])
    }

    String toString(){
        "$code,$description"
    }

    transient getBrokerTypeName(){

        if (brokerType.equals("DealerBroker"))
            return "کارگزار فروشنده"
        else
            return "کارگزار خریدار"

    }
}
