package bahman

class ReportController {

    def report(){

    }

    def contract() {
        def contractInstance=new Contract()
        [contractInstance:contractInstance]
    }
}
