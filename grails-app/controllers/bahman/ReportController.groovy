package bahman

class ReportController {

    def report(){

    }

    def contractPhase() {
        [reportParams:params]
    }

    def showContractPhaseReport() {
        redirect(action: "contractPhase", params: params)
    }


    def product() {
        [reportParams:params]
    }

    def showProductReport(){
        redirect(action: "product", params: params)
    }

    def searchAll(){
        [reportParams:params]
    }

    def showSearchAllReport(){
        redirect(action: "searchAll", params: params)
    }
}
