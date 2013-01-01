package bahman

class PhaseService {

    def serviceMethod() {

    }

    def addDefaultPhases(contract){
        if (contract.Phases?.size() > 0)
            return //We only want to add Phases to a new contract
        def usr0=User.findByUsername("user0")
        contract.addToPhases new Phase(phase: "DealerBroker",comment: "", organization:usr0, startDate:new Date(),status:"O" ).save()
        contract.save()
    }
}
