package bahman

class Broker extends Organization{

    String brokerType
    Number iralcoSeq
    String iralcoDate


    static constraints = {
        brokerTypeName()
        brokerType(nullable: false,inList: ["BuyerBroker","DealerBroker"])
        iralcoSeq(nullable: true)
        iralcoDate(nullable: true)
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
