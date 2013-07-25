package bahman

class Manufacturer extends Organization {
    String sellerName
    String businessId
    String address
    String phoneNo
    String postalCode
    String fax
//    String draftNoFormat
    String draftNoSequence

    static constraints = {
        sellerName(nullable: true, maxSize: 200)
        businessId(nullable:true ,maxSize:15 )
        address (nullable: true,maxSize: 200)
        phoneNo (nullable: true,maxSize: 15)
        postalCode (nullable: true,maxSize: 10)
        fax (nullable: true,maxSize: 15)
//        draftNoFormat(nullable: true,maxSize: 100)
        draftNoSequence(nullable: true,maxSize: 100)
    }
}
