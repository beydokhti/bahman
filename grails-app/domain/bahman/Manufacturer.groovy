package bahman

class Manufacturer extends Organization {
    String sellerName
    String businessId
    String address
    String phoneNo
    String postalCode
    String fax

    static constraints = {
        sellerName(nullable: true, maxSize: 200)
        businessId(nullable:true ,maxSize:15 )
        address (nullable: true,maxSize: 200)
        phoneNo (nullable: true,maxSize: 15)
        postalCode (nullable: true,maxSize: 10)
        fax (nullable: true,maxSize: 15)
    }
}
