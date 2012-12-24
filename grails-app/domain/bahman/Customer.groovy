package bahman

class Customer extends User{
    String code
    String description
    static constraints = {
        code(blank: false)
    }
}
