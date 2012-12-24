package bahman

class Organization extends User {
    String code
    String description
    static constraints = {
        code (blank: false)
        description (blank:false)
    }
}
