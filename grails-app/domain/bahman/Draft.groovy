package bahman

class Draft {
    String description
    byte[] document
//    String status //pass-reject
    Date uploadDate
    Organization responsible
    String fileName
    String contentType
    String versionNo

    static constraints = {
        description(nullable:true,maxSize: 100,unique: true)
        document(nullable: true, maxSize:5000000)
//        status(nullable: true,inList:["P","R"])
        uploadDate(nullable:false)
        responsible(nullable:false,maxSize: 50)
        fileName(nullable: true,maxSize: 256)
        contentType(nullable: true,maxSize: 265)
        versionNo(nullable: true,maxSize: 50)
    }
}
