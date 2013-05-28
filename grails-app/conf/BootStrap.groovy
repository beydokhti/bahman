import bahman.Amendment
import bahman.Attachment
import bahman.Broker
import bahman.Contract
import bahman.Customer
import bahman.Manufacturer
import bahman.Phase
import bahman.Role
import bahman.SubRole
import bahman.Supplier
import bahman.User
import bahman.UserRole
import sun.security.krb5.internal.crypto.DesMacCksumType

class BootStrap {

    def init = { servletContext ->
        def dbRole = Role.findByAuthority("DealerBroker")?:new Role(authority: "DealerBroker").save()
        def mRole = Role.findByAuthority( "Manufacturer")?:new Role(authority: "Manufacturer").save()
        def sRole = Role.findByAuthority( "Supplier")?:new Role(authority: "Supplier").save()
        def bbRole = Role.findByAuthority("BuyerBroker")?:new Role(authority: "BuyerBroker").save()
        def custRole = Role.findByAuthority( "Customer")?:new Role(authority: "Customer").save()
        def admRole = Role.findByAuthority("Admin")?:new Role(authority: "Admin").save()


        def admuser =  User.findByUsername("admin")?:new User(username: 'admin', password: 'admin123', enabled: true).save()
//        admuser.save()
        def ur =UserRole.findByUser(admuser)?:UserRole.create(admuser, admRole)

//        def usr0 =  User.findByUsername("user0")?:new Broker(code: "31", description: "بهمن", username: "user0", password: "test", enabled: true, brokerType: "DealerBroker").save()
//        def userRole0 = UserRole.create(usr0, dbRole)
//        def usr1 = new Broker(code: "24", description: "بانک کشاورزي", username: "user1", password: "test", enabled: true, brokerType: "BuyerBroker").save()
//        def userRole1 = UserRole.create(usr1, bbRole)
//        def usr2 = new Broker(code: "31", description: "بهمن", username: "user2", password: "test", enabled: true, brokerType: "DealerBroker").save()
//        def userRole2 = UserRole.create(usr2, dbRole)
//
//        def usr4 = new Customer(code: "11140", description: "شرکت نوين شيمي سلفچگان", username: "user4", password: "test", enabled: true, mobileNo: '09125348230').save()
//        def userRole4 = UserRole.create(usr4, custRole)
//
//        def usr5 = new Manufacturer(code: "01", description:"پالایشگاه تبریز", username: "user5", password: "test", enabled: true).save()
//        def userRole5 = UserRole.create(usr5, mRole)
//
//        def usr6 = new Supplier(code: "359", description: "عرضه کننده", username: "user6", password: "test", enabled: true).save()
//        def userRole6 = UserRole.create(usr6, sRole)
        def bahman1 = Broker.findByUsername("novin1")?:new Broker(code: "54", description: "کارشناس فروش", username: "novin1", password: "test", enabled: true, brokerType: "DealerBroker").save()
        def userRole11 =UserRole.findByUser(bahman1)?: UserRole.create(bahman1, dbRole)
        def bahman2 = Broker.findByUsername("novin2")?:new Broker(code: "29", description: "کارشناس خرید", username: "novin2", password: "test", enabled: true, brokerType: "BuyerBroker").save()
        def userRole12 = UserRole.findByUser(bahman2)?:UserRole.create(bahman2, bbRole)
        def customer1 = Customer.findByUsername("azarbam")?:new Customer(code: "1251", description: "شرکت آذربام عایق کار", username: "azarbam", password: "test", enabled: true, mobileNo: '09125348230').save()
        def userRole13 = UserRole.findByUser(customer1)?:UserRole.create(customer1, custRole)
        def tolid =  Manufacturer.findByUsername("tolidi")?:new Manufacturer(code: "359", description:"پالایشگاه تبریز", username: "tolidi", password: "test", enabled: true).save()
        def userRole14 = UserRole.findByUser(tolid)?:UserRole.create(tolid, mRole)
        def bazargani = Supplier.findByUsername("bazargani")?:new Supplier(code: "359", description: "پالایشگاه تبریز", username: "bazargani", password: "test", enabled: true).save()
        def userRole15 =UserRole.findByUser(bazargani)?: UserRole.create(bazargani, sRole)
//
//        def phase2 = new Phase(phase: "DealerBroker", comment: "test2", organization: bahman1, startDate: new Date(), status: "Waiting").save()
//        def phase1 = new Phase(phase: "BuyerBroker", comment: "test1", organization: bahman2, startDate: new Date(), endDate: new Date(), status: "Pass").save()
//        def phase3 = new Phase(phase: "BuyerBroker", comment: "test1", organization: bahman2, startDate: new Date(), status: "Waiting").save()
//        def phase4 = new Phase(phase: "BuyerBroker", comment: "test1", organization: bahman2, startDate: new Date(), endDate: new Date(), status: "Pass").save()
//        def phase5 = new Phase(phase: "DealerBroker", comment: "test2", organization: bahman1, startDate: new Date(), endDate: new Date(), status: "Pass").save()
//        def phase6 = new Phase(phase: "Supplier", comment: "test2", organization: bazargani, startDate: new Date(), status: "Waiting").save()
//        def phase7 = new Phase(phase: "Supplier", comment: "test2", organization: bazargani, startDate: new Date(), status: "Pass").save()
//        def phase8 = new Phase(phase: "Manufacturer", comment: "test2", organization: bazargani, startDate: new Date(), status: "Waiting").save()
//
//
//        def contract1 = new Contract(contractNo: "1391193129",
//                contractPartNo: "1",
//                contractDate: new Date(),
//                allotmentDate: new Date(),
//                settlementDeadline: new Date(),
//                settlementType: "نقدي",
//                dealerBrokerDesc: "بهمن",
//                buyerBrokerDesc: "بانک کشاورزي",
//                customerDesc: "شرکت نوين شيمي سلفچگان",
//                productSymbol: "TORC-LUSUB-00",
//                productDesc: "گوگرد کلوخه",
//                totalShipments: "30",
//                price: "2570",
//                contractType: "نقدي",
//                deliveryDate: new Date(),
//                manufacturerDesc: "پالايشگاه تبريز",
//                deliveryPlace: "انبار کارخانه",
//                productMainGroup: "پتروشيمي و فرآورده هاي نفتي",
//                productGroup: "گوگرد",
//                productSubGroup: "گوگرد",
//                weight: "1000",
//                quantity: "30000",
//                buyerBrokerCode: "31",
//                dealerBrokerCode: "31",
//                customerCode: "11140",
//                supplierCode: "359",
//                boursePrice: "2570",
//                settlementDate: new Date(),
//                contractID: "102419312900164",
//                releaseDate: new Date(),
//                importDate: new Date(),
////                settlementCertificate:attachment
//        ).save()
//
//        contract1.addToPhases(phase1)
//        contract1.addToPhases(phase2)
//        contract1.save()
//        def contract2 = new Contract(contractNo: "1391193129",
//                contractPartNo: "2",
//                contractDate: new Date(),
//                allotmentDate: new Date(),
//                settlementDeadline: new Date(),
//                settlementType: "نقدي",
//                dealerBrokerDesc: "بهمن",
//                buyerBrokerDesc: "بانک کشاورزي",
//                customerDesc: "شرکت نوين شيمي سلفچگان",
//                productSymbol: "TORC-LUSUB-00",
//                productDesc: "گوگرد کلوخه",
//                totalShipments: "30",
//                price: "2570",
//                contractType: "نقدي",
//                deliveryDate: new Date(),
//                manufacturerDesc: "پالايشگاه تبريز",
//                deliveryPlace: "انبار کارخانه",
//                productMainGroup: "پتروشيمي و فرآورده هاي نفتي",
//                productGroup: "گوگرد",
//                productSubGroup: "گوگرد",
//                weight: "1000",
//                quantity: "30000",
//                buyerBrokerCode: "31",
//                dealerBrokerCode: "31",
//                customerCode: "11140",
//                supplierCode: "359",
//                boursePrice: "2570",
//                settlementDate: new Date(),
//                contractID: "102419312900164",
//                releaseDate: new Date(),
//                importDate: new Date(),
////                settlementCertificate:attachment
//        ).save()
//
//        contract2.addToPhases(phase3)
//        contract2.save()
//
//
//        def contract3 = new Contract(contractNo: "1391193129",
//                contractPartNo: "3",
//                contractDate: new Date(),
//                allotmentDate: new Date(),
//                settlementDeadline: new Date(),
//                settlementType: "نقدي",
//                dealerBrokerDesc: "بهمن",
//                buyerBrokerDesc: "بانک کشاورزي",
//                customerDesc: "شرکت نوين شيمي سلفچگان",
//                productSymbol: "TORC-LUSUB-00",
//                productDesc: "گوگرد کلوخه",
//                totalShipments: "30",
//                price: "2570",
//                contractType: "نقدي",
//                deliveryDate: new Date(),
//                manufacturerDesc: "پالايشگاه تبريز",
//                deliveryPlace: "انبار کارخانه",
//                productMainGroup: "پتروشيمي و فرآورده هاي نفتي",
//                productGroup: "گوگرد",
//                productSubGroup: "گوگرد",
//                weight: "1000",
//                quantity: "30000",
//                buyerBrokerCode: "31",
//                dealerBrokerCode: "31",
//                customerCode: "11140",
//                supplierCode: "359",
//                boursePrice: "2570",
//                settlementDate: new Date(),
//                contractID: "102419312900164",
//                releaseDate: new Date(),
//                importDate: new Date(),
////                settlementCertificate:attachment
//        ).save()
//
//        contract3.addToPhases(phase4)
//        contract3.addToPhases(phase5)
//        contract3.addToPhases(phase6)
//        contract3.save()
//
//        def contract4 = new Contract(contractNo: "1391193129",
//                contractPartNo: "4",
//                contractDate: new Date(),
//                allotmentDate: new Date(),
//                settlementDeadline: new Date(),
//                settlementType: "نقدي",
//                dealerBrokerDesc: "بهمن",
//                buyerBrokerDesc: "بانک کشاورزي",
//                customerDesc: "شرکت نوين شيمي سلفچگان",
//                productSymbol: "TORC-LUSUB-00",
//                productDesc: "گوگرد کلوخه",
//                totalShipments: "30",
//                price: "2570",
//                contractType: "نقدي",
//                deliveryDate: new Date(),
//                manufacturerDesc: "پالايشگاه تبريز",
//                deliveryPlace: "انبار کارخانه",
//                productMainGroup: "پتروشيمي و فرآورده هاي نفتي",
//                productGroup: "گوگرد",
//                productSubGroup: "گوگرد",
//                weight: "1000",
//                quantity: "30000",
//                buyerBrokerCode: "31",
//                dealerBrokerCode: "31",
//                customerCode: "11140",
//                supplierCode: "359",
//                boursePrice: "2570",
//                settlementDate: new Date(),
//                contractID: "102419312900164",
//                releaseDate: new Date(),
//                importDate: new Date(),
////                settlementCertificate:attachment
//        ).save()
//
//        contract4.addToPhases(phase4)
//        contract4.addToPhases(phase5)
//        contract4.addToPhases(phase7)
//        contract4.addToPhases(phase8)
//        contract4.save()
//
//        def draft =new Attachment(description: "123456789",uploadDate:new Date(),responsible:bazargani).save()
//        contract4.addToDrafts(draft).save()
//
//        def amendment = new Amendment(amendmentDate: new Date(),
//                contractPartNo: contract2.contractPartNo,
//                contractNo: contract2.contractNo,
//                comment: "Test")
//        amendment.addToPhases(phase2)
//        amendment.save()
//        contract2.addToAmendments(amendment)
//

    }

    def destroy = {
    }
}
