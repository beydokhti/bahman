import bahman.Attachment
import bahman.Broker
import bahman.Contract
import bahman.Customer
import bahman.Manufacturer
import bahman.Phase
import bahman.Role
import bahman.SubRole
import bahman.Supplier
import bahman.UserRole
import sun.security.krb5.internal.crypto.DesMacCksumType

class BootStrap {

    def init = { servletContext ->
        def orgRole=new Role(authority: "Organization").save()
        def custRole=new Role(authority: "Customer").save()

        def subRole1=new SubRole(roleName:"Buyer").save()
        def subRole2=new SubRole(roleName:"Dealer").save()

        def usr0=new Broker(code: "31",description:"بهمن",username: "user0",password: "test",enabled: true).save()
        def userRole0= UserRole.create(usr0,orgRole)
        userRole0.addToSubRoles(subRole2)
        userRole0.addToSubRoles(subRole1)
//       --------------------------------
        def usr1=new Broker(code: "24",description:"بانک کشاورز?",username: "user1",password: "test",enabled: true).save()
        def userRole1= UserRole.create(usr1,orgRole)
        userRole1.addToSubRoles(subRole1)


        def usr2=new Broker(code: "31",description:"بهمن",username: "user2",password: "test",enabled: true).save()
        def userRole2= UserRole.create(usr2,orgRole)
        userRole2.addToSubRoles(subRole2)
        userRole2.addToSubRoles(subRole1)

        def usr4=new Customer (code: "11140",description:"شرکت نو?ن ش?م? سلفچگان",username: "user4",password: "test",enabled: true).save()
        def userRole4= UserRole.create(usr4,custRole)

        def usr5=new Manufacturer (code: "01",description:"پالا?شگاه تبر?ز",username: "user5",password: "test",enabled: true) .save()
        def userRole5= UserRole.create(usr5,orgRole)

        def usr6=new Supplier (code: "359",description:"عرضه کننده",username: "user6",password: "test",enabled: true) .save()
        def userRole6= UserRole.create(usr6,orgRole)

//        def attachment = new Attachment(uploadDate:new Date('1391/09/22')
//                            ,description: "test1"
//                            ,responsible: usr1
//                            ,status:"P"
//                            ,document: ${resource(dir:'images',file:'settelmentCer.png')}).save()

        def phase1=new Phase(phase: "BuyerBroker",comment: "test1", organization: usr1, startDate:new Date('1391/09/22'),endDate:new Date('1391/09/22'),status:"O" ).save()
        def phase2=new Phase(phase: "Supplier",comment: "test2", organization: usr6, startDate:new Date('1391/09/22'),status:"W" ).save()

        def contract1= new Contract(contractNo  :"1391193129",
                contractPartNo  :"1",
                contractDate :new Date('1391/09/22'),
                allotmentDate :new Date('1391/09/22'),
                settlementDeadline :new Date('1391/09/27'),
                settlementType  :"نقد?",
                dealerBrokerDesc  :"بهمن",
                buyerBrokerDesc  :"بانک کشاورز?",
                customerDesc  :"شرکت نو?ن ش?م? سلفچگان",
                productSymbol  :"TORC-LUSUB-00",
                productDesc  :"گوگرد کلوخه",
                totalShipments  :"30",
                price  :"2570",
                contractType  :"نقد?",
                deliveryDate :new Date('1391/09/27'),
                manufacturerDesc  :"پالا?شگاه تبر?ز",
                deliveryPlace  :"انبار کارخانه",
                productMainGroup  :"پتروش?م? و فرآورده ها? نفت?",
                productGroup  :"گوگرد",
                productSubGroup  :"گوگرد",
                weight  :"1000",
                quantity  :"30000",
                buyerBrokerCode  :"24",
                dealerBrokerCode  :"31",
                customerCode  :"11140",
                supplierCode  :"359",
                boursePrice  :"2570",
                settlementDate :new Date('1391/09/29'),
                contractID  :"102419312900164",
                releaseDate :new Date('1391/09/22'),
                importDate :new Date('1391/09/22'),
//                settlementCertificate:attachment
        ).save()

        contract1.addToPhases(phase1)
        contract1.addToPhases(phase2)
        contract1.save()
    }
    def destroy = {
    }
}
