package bahman

class ReportController {

    def report(){

    }

    def contract() {
    }

    def product() {
    }

    def searchAll(){
//        def reportParams =[:]
        [reportParams:params]
    }

    def showSearchAllReport(){
        redirect(action: "searchAll", params: params)
    }
}
