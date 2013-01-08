package bahman

class Broker extends Organization{

    String brokerType
    static constraints = {
//        brokerSubRoleName()
        brokerType(nullable: false,inList: ["Buyer","Dealer"])
    }
    String toString(){
        "$code,$description"
    }
//    transient brokerSubRoleName(){
//        def userRole = UserRole.findByUser(this)
//        def dealer="N"
//        for (sb in userRole.subRoles)
//        {
//            if (sb.roleName =="Dealer")
//                dealer="Y"
//        }
//        if (dealer.equals("Y"))
//            return "کارگزار فروشنده"
//        else
//            return "کارگزار خریدار"

//    }
}
