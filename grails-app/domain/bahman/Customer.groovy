package bahman

class Customer extends User{
    String code
    String description
    String mobileNo

    static constraints = {
        code(nullable: false,blank: false ,maxSize: 200)
        description(nullable: true, maxSize: 200)
        mobileNo(nullable: true,maxSize: 15)
    }
}
