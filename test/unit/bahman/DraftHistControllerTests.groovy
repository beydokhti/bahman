package bahman



import org.junit.*
import grails.test.mixin.*

@TestFor(DraftHistController)
@Mock(DraftHist)
class DraftHistControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/draftHist/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.draftHistInstanceList.size() == 0
        assert model.draftHistInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.draftHistInstance != null
    }

    void testSave() {
        controller.save()

        assert model.draftHistInstance != null
        assert view == '/draftHist/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/draftHist/show/1'
        assert controller.flash.message != null
        assert DraftHist.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/draftHist/list'


        populateValidParams(params)
        def draftHist = new DraftHist(params)

        assert draftHist.save() != null

        params.id = draftHist.id

        def model = controller.show()

        assert model.draftHistInstance == draftHist
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/draftHist/list'


        populateValidParams(params)
        def draftHist = new DraftHist(params)

        assert draftHist.save() != null

        params.id = draftHist.id

        def model = controller.edit()

        assert model.draftHistInstance == draftHist
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/draftHist/list'

        response.reset()


        populateValidParams(params)
        def draftHist = new DraftHist(params)

        assert draftHist.save() != null

        // test invalid parameters in update
        params.id = draftHist.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/draftHist/edit"
        assert model.draftHistInstance != null

        draftHist.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/draftHist/show/$draftHist.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        draftHist.clearErrors()

        populateValidParams(params)
        params.id = draftHist.id
        params.version = -1
        controller.update()

        assert view == "/draftHist/edit"
        assert model.draftHistInstance != null
        assert model.draftHistInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/draftHist/list'

        response.reset()

        populateValidParams(params)
        def draftHist = new DraftHist(params)

        assert draftHist.save() != null
        assert DraftHist.count() == 1

        params.id = draftHist.id

        controller.delete()

        assert DraftHist.count() == 0
        assert DraftHist.get(draftHist.id) == null
        assert response.redirectedUrl == '/draftHist/list'
    }
}
