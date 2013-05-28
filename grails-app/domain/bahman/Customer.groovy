package bahman

class Customer extends User{
    String code
    String description
    String mobileNo
    String nId
    String businessId
    String address
    String phoneNo
    String postalCode

    static constraints = {
        code(nullable: false,blank: false ,maxSize: 200)
        description(nullable: true, maxSize: 200)
        mobileNo(nullable: true,maxSize: 15)
        nId(nullable: true,maxSize: 10)
        businessId(nullable:true ,maxSize:15 )
        address (nullable: true,maxSize: 200)
        phoneNo (nullable: true,maxSize: 15)
        postalCode (nullable: true,maxSize: 10)
    }
}
