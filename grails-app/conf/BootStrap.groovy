import bahman.Broker
import bahman.Contract
import bahman.Customer
import bahman.Manufacturer
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

        def usr1=new Broker(code: "24",description:"بانک کشاورزی",username: "user1",password: "test",enabled: true).save()
        def userRole1= UserRole.create(usr1,orgRole)
        userRole1.addToSubRoles(subRole1)


        def usr2=new Broker(code: "31",description:"بهمن",username: "user2",password: "test",enabled: true).save()
        def userRole2= UserRole.create(usr2,orgRole)
        userRole2.addToSubRoles(subRole2)
        userRole2.addToSubRoles(subRole1)

        def usr4=new Customer (code: "11140",description:"شرکت نوین شیمی سلفچگان",username: "user4",password: "test",enabled: true).save()
        def userRole4= UserRole.create(usr4,custRole)

        def usr5=new Manufacturer (code: "01",description:"پالایشگاه تبریز",username: "user5",password: "test",enabled: true) .save()
        def userRole5= UserRole.create(usr5,orgRole)

        def usr6=new Supplier (code: "359",description:"عرضه کننده",username: "user5",password: "test",enabled: true) .save()
        def userRole6= UserRole.create(usr6,orgRole)

        def contract1= new Contract(contractNo  :"1391193129",
                contractPartNo  :"1",
                contractDate :new Date('1391/09/22'),
                allotmentDate :new Date('1391/09/22'),
                settlementDeadline :new Date('1391/09/27'),
                settlementType  :"نقدی",
                dealerBrokerDesc  :"بهمن",
                buyerBrokerDesc  :"بانک کشاورزی",
                customerDesc  :"شرکت نوین شیمی سلفچگان",
                productSymbol  :"TORC-LUSUB-00",
                productDesc  :"گوگرد کلوخه",
                totalShipments  :"30",
                price  :"2570",
                contractType  :"نقدی",
                deliveryDate :new Date('1391/09/27'),
                manufacturerDesc  :"پالایشگاه تبریز",
                deliveryPlace  :"انبار کارخانه",
                productMainGroup  :"پتروشیمی و فرآورده های نفتی",
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
        ).save()



    }
    def destroy = {
    }
}
