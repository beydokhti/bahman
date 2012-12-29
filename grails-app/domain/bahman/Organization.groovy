package bahman

class Organization extends User {
    String code
    String description

    static constraints = {
        code (nullable: false,blank: false,maxSize: 50,unique: true)
        description (nullable: false,blank:false,maxSize: 200)
    }
}