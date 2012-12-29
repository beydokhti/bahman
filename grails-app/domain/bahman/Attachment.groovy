package bahman

class Attachment {
    String description
    byte[] document
    String status //pass-reject
    Date uploadDate
    Organization responsible

    static constraints = {
        description(nullable:true,maxSize: 1024)
        document(nullable: false, maxSize:1000000)
        status(nullable: true,inList:["P","R"])
        uploadDate(nullable:false)
        responsible(nullable:false,maxSize: 50)
    }
}