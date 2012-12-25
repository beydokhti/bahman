package bahman

class Attachment {
    String description
    byte[] document
    Boolean status //pass-reject
    Date uploadDate
    Organization responsible

    static constraints = {
        description(blank:false)
    }
}
