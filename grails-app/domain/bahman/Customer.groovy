package bahman

class Customer extends User{
    String code
    String description

    static constraints = {
        code(nullable: false,blank: false ,maxSize: 200)
        description(nullable: true, maxSize: 200)
    }
}
