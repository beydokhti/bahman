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
        def mRole = new Role(authority: "Manufacturer").save()
        def sRole = new Role(authority: "Supplier").save()
        def bbRole = new Role(authority: "BuyerBroker").save()
        def custRole = new Role(authority: "Customer").save()
        def admRole = new Role(authority: "Admin").save()


        def admuser = new User(username: 'admin', password: 'admin123', enabled: true)
        admuser.save()
        UserRole.create(admuser, admRole)

        def usr0 = new Broker(code: "31", description: "بهمن", username: "user0", password: "test", enabled: true, brokerType: "DealerBroker").save()
        def userRole0 = UserRole.create(usr0, dbRole)
        def usr1 = new Broker(code: "24", description: "بانک کشاورزي", username: "user1", password: "test", enabled: true, brokerType: "BuyerBroker").save()
        def userRole1 = UserRole.create(usr1, bbRole)
        def usr2 = new Broker(code: "31", description: "بهمن", username: "user2", password: "test", enabled: true, brokerType: "DealerBroker").save()
        def userRole2 = UserRole.create(usr2, dbRole)

        def usr4 = new Customer(code: "11140", description: "شرکت نوين شيمي سلفچگان", username: "user4", password: "test", enabled: true, mobileNo: '09125348230').save()
        def userRole4 = UserRole.create(usr4, custRole)

        def usr5 = new Manufacturer(code: "01", description:"پالایشگاه تبریز", username: "user5", password: "test", enabled: true).save()
        def userRole5 = UserRole.create(usr5, mRole)

        def usr6 = new Supplier(code: "359", description: "عرضه کننده", username: "user6", password: "test", enabled: true).save()
        def userRole6 = UserRole.create(usr6, sRole)
        def bahman1 = Broker.findByUsername("bahman1")?:new Broker(code: "31", description: "کارشناس فروش", username: "bahman1", password: "test", enabled: true, brokerType: "DealerBroker").save()
        def userRole11 = UserRole.create(bahman1, dbRole)
        def bahman2 = new Broker(code: "31", description: "کارشناس خرید", username: "bahman2", password: "test", enabled: true, brokerType: "BuyerBroker").save()
        def userRole12 = UserRole.create(bahman2, bbRole)
        def customer1 = new Customer(code: "1251", description: "شرکت آذربام عایق کار", username: "azarbam", password: "test", enabled: true, mobileNo: '09125348230').save()
        def userRole13 = UserRole.create(customer1, custRole)
        def tolid = new Manufacturer(code: "01", description:"پالایشگاه تبریز", username: "tolid", password: "test", enabled: true).save()
        def userRole14 = UserRole.create(tolid, mRole)
        def bazargani = new Supplier(code: "359", description: "عرضه کننده", username: "bazargani", password: "test", enabled: true).save()
        def userRole15 = UserRole.create(bazargani, sRole)
    }


    def destroy = {
    }
}
