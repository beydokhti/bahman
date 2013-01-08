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

//        def subRole1=new SubRole(roleName:"Buyer").save()
//        def subRole2=new SubRole(roleName:"Dealer").save()

        def usr0=new Broker(code: "31",description:"بهمن",username: "user0",password: "test",enabled: true,brokerType: "DealerBroker").save()
//        usr0.save()
        def userRole0= UserRole.create(usr0,orgRole)
//        userRole0.addToSubRoles(subRole2)
//        userRole0.addToSubRoles(subRole1)
//       --------------------------------
        def usr1=new Broker(code: "24",description:"بانک کشاورزي",username: "user1",password: "test",enabled: true,brokerType: "BuyerBroker").save()
//        usr1.save().sav
        def userRole1= UserRole.create(usr1,orgRole)
//        userRole1.addToSubRoles(subRole1)


        def usr2=new Broker(code: "31",description:"بهمن",username: "user2",password: "test",enabled: true,brokerType: "DealerBroker").save()
        def userRole2= UserRole.create(usr2,orgRole)
//        userRole2.addToSubRoles(subRole2)
//        userRole2.addToSubRoles(subRole1)

        def usr4=new Customer (code: "11140",description:"شرکت نوين شيمي سلفچگان",username: "user4",password: "test",enabled: true,mobileNo:'09125348230').save()
        def userRole4= UserRole.create(usr4,custRole)

        def usr5=new Manufacturer (code: "01",description:"پالايشگاه تبريز",username: "user5",password: "test",enabled: true) .save()
        def userRole5= UserRole.create(usr5,orgRole)

        def usr6=new Supplier (code: "359",description:"عرضه کننده",username: "user6",password: "test",enabled: true) .save()
        def userRole6= UserRole.create(usr6,orgRole)

//        def attachment = new Attachment(uploadDate:new Date('1391/09/22')
//                            ,description: "test1"
//                            ,responsible: usr1
//                            ,status:"P"
//                            ,document: ${resource(dir:'images',file:'settelmentCer.png')}).save()

        def phase1=new Phase(phase: "BuyerBroker",comment: "test1", organization: usr1, startDate:new Date('2012/12/22'),endDate:new Date('2012/09/23'),status:"Pass" ).save()
        def phase2=new Phase(phase: "DealerBroker",comment: "test2", organization: usr6, startDate:new Date('2012/09/23'),status:"Waiting" ).save()
        def phase3=new Phase(phase: "BuyerBroker",comment: "test1", organization: usr1, startDate:new Date('2012/09/22'),status:"Waiting" ).save()
        def phase4=new Phase(phase: "BuyerBroker",comment: "test1", organization: usr1, startDate:new Date('2012/09/22'),endDate:new Date('2012/09/23'),status:"Pass" ).save()
        def phase5=new Phase(phase: "DealerBroker",comment: "test2", organization: usr6, startDate:new Date('2012/09/23'),endDate:new Date('2012/09/24'),status:"Pass" ).save()
        def phase6=new Phase(phase: "Supplier",comment: "test2", organization: usr6, startDate:new Date('2012/09/24'),status:"Waiting" ).save()


        def contract1= new Contract(contractNo  :"1391193129",
                contractPartNo  :"1",
                contractDate :new Date('1391/09/22'),
                allotmentDate :new Date('1391/09/22'),
                settlementDeadline :new Date('1391/09/27'),
                settlementType  :"نقدي",
                dealerBrokerDesc  :"بهمن",
                buyerBrokerDesc  :"بانک کشاورزي",
                customerDesc  :"شرکت نوين شيمي سلفچگان",
                productSymbol  :"TORC-LUSUB-00",
                productDesc  :"گوگرد کلوخه",
                totalShipments  :"30",
                price  :"2570",
                contractType  :"نقدي",
                deliveryDate :new Date('1391/09/27'),
                manufacturerDesc  :"پالايشگاه تبريز",
                deliveryPlace  :"انبار کارخانه",
                productMainGroup  :"پتروشيمي و فرآورده هاي نفتي",
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
        def contract2= new Contract(contractNo  :"1391193129",
                contractPartNo  :"2",
                contractDate :new Date('1391/09/22'),
                allotmentDate :new Date('1391/09/22'),
                settlementDeadline :new Date('1391/09/27'),
                settlementType  :"نقدي",
                dealerBrokerDesc  :"بهمن",
                buyerBrokerDesc  :"بانک کشاورزي",
                customerDesc  :"شرکت نوين شيمي سلفچگان",
                productSymbol  :"TORC-LUSUB-00",
                productDesc  :"گوگرد کلوخه",
                totalShipments  :"30",
                price  :"2570",
                contractType  :"نقدي",
                deliveryDate :new Date('1391/09/27'),
                manufacturerDesc  :"پالايشگاه تبريز",
                deliveryPlace  :"انبار کارخانه",
                productMainGroup  :"پتروشيمي و فرآورده هاي نفتي",
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

        contract2.addToPhases(phase3)
        contract2.save()


        def contract3= new Contract(contractNo  :"1391193129",
                contractPartNo  :"3",
                contractDate :new Date('1391/09/22'),
                allotmentDate :new Date('1391/09/22'),
                settlementDeadline :new Date('1391/09/27'),
                settlementType  :"نقدي",
                dealerBrokerDesc  :"بهمن",
                buyerBrokerDesc  :"بانک کشاورزي",
                customerDesc  :"شرکت نوين شيمي سلفچگان",
                productSymbol  :"TORC-LUSUB-00",
                productDesc  :"گوگرد کلوخه",
                totalShipments  :"30",
                price  :"2570",
                contractType  :"نقدي",
                deliveryDate :new Date('1391/09/27'),
                manufacturerDesc  :"پالايشگاه تبريز",
                deliveryPlace  :"انبار کارخانه",
                productMainGroup  :"پتروشيمي و فرآورده هاي نفتي",
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

        contract3.addToPhases(phase4)
        contract3.addToPhases(phase5)
        contract3.addToPhases(phase6)
        contract3.save()

    }




    def destroy = {
    }
}
