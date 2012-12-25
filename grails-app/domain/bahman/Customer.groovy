package bahman

class Customer extends User{
    String code
    String description

    static constraints = {
        code(blank: false)
        description(maxSize: 1024)
    }
}
