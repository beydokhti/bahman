package bahman

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser

class PhaseService {
    def springSecurityService
    def addDefaultPhases(Contract contract){
        if (contract.phases?.size() > 0)
            return //We only want to add Phases to a new contract
        def princ = springSecurityService.getPrincipal()
        def user
        if (princ instanceof GrailsUser) {
            user = User.findByUsername(princ.username)
        }
            else
        {user =User.findByUsername("user0")}
        contract.addToPhases new Phase(phase: "BuyerBroker",comment: "", organization:null, startDate:new Date(),status:"Waiting" ).save()
        contract.save()
    }
}
