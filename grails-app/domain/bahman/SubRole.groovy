package bahman

class SubRole {
    String roleName

    static constraints = {
        roleName( blank: false, nullable: false,unique: true)
    }
}
