package bahman

import org.springframework.dao.DataIntegrityViolationException

class BrokerController {

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [brokerInstanceList: Broker.list(params), brokerInstanceTotal: Broker.count()]
    }

    def create() {
        [brokerInstance: new Broker(params)]
    }

    def save() {
        def brokerInstance = new Broker(params)
        if (!brokerInstance.save(flush: true)) {
            render(view: "create", model: [brokerInstance: brokerInstance])
            return
        }
        def role
        if (brokerInstance.brokerType.equals("DealerBroker"))
            role=Role.findByAuthority("DealerBroker")
        else if (brokerInstance.brokerType.equals("BuyerBroker"))
            role=Role.findByAuthority("DealerBroker")
        UserRole.create(brokerInstance,role)

        flash.message = message(code: 'default.created.message', args: [message(code: 'broker.label', default: 'Broker'), brokerInstance.id])
        redirect(action: "show", id: brokerInstance.id)
    }

    def show() {
        def brokerInstance = Broker.get(params.id)
        if (!brokerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])
            redirect(action: "list")
            return
        }

        [brokerInstance: brokerInstance]
    }

    def edit() {
        def brokerInstance = Broker.get(params.id)
        if (!brokerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])
            redirect(action: "list")
            return
        }

        [brokerInstance: brokerInstance]
    }

    def update() {
        def brokerInstance = Broker.get(params.id)
        if (!brokerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (brokerInstance.version > version) {
                brokerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'broker.label', default: 'Broker')] as Object[],
                        "Another user has updated this Broker while you were editing")
                render(view: "edit", model: [brokerInstance: brokerInstance])
                return
            }
        }

        brokerInstance.properties = params

        if (!brokerInstance.save(flush: true)) {
            render(view: "edit", model: [brokerInstance: brokerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'broker.label', default: 'Broker'), brokerInstance.id])
        redirect(action: "show", id: brokerInstance.id)
    }

    def delete() {
        def brokerInstance = Broker.get(params.id)
        if (!brokerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])
            redirect(action: "list")
            return
        }

        try {
            brokerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
