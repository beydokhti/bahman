package bahman

class Sms {
    String message
    String mobileNo
    Date sentDate

    static constraints = {
        message(nullable: false,maxSize: 250)
        mobileNo(nullable: false,maxSize: 15)
        sentDate(nullable: false)
    }
}
