package bahman.report



import org.junit.*
import grails.test.mixin.*

@TestFor(ContractReportController)
@Mock(ContractReport)
class ContractReportControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contractReport/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contractReportInstanceList.size() == 0
        assert model.contractReportInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.contractReportInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contractReportInstance != null
        assert view == '/contractReport/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contractReport/show/1'
        assert controller.flash.message != null
        assert ContractReport.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contractReport/list'


        populateValidParams(params)
        def contractReport = new ContractReport(params)

        assert contractReport.save() != null

        params.id = contractReport.id

        def model = controller.show()

        assert model.contractReportInstance == contractReport
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contractReport/list'


        populateValidParams(params)
        def contractReport = new ContractReport(params)

        assert contractReport.save() != null

        params.id = contractReport.id

        def model = controller.edit()

        assert model.contractReportInstance == contractReport
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contractReport/list'

        response.reset()


        populateValidParams(params)
        def contractReport = new ContractReport(params)

        assert contractReport.save() != null

        // test invalid parameters in update
        params.id = contractReport.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contractReport/edit"
        assert model.contractReportInstance != null

        contractReport.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contractReport/show/$contractReport.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contractReport.clearErrors()

        populateValidParams(params)
        params.id = contractReport.id
        params.version = -1
        controller.update()

        assert view == "/contractReport/edit"
        assert model.contractReportInstance != null
        assert model.contractReportInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contractReport/list'

        response.reset()

        populateValidParams(params)
        def contractReport = new ContractReport(params)

        assert contractReport.save() != null
        assert ContractReport.count() == 1

        params.id = contractReport.id

        controller.delete()

        assert ContractReport.count() == 0
        assert ContractReport.get(contractReport.id) == null
        assert response.redirectedUrl == '/contractReport/list'
    }
}
