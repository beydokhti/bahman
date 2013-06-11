package bahman



import org.junit.*
import grails.test.mixin.*

@TestFor(DraftController)
@Mock(Draft)
class DraftControllerTests {


    def populateValidParams(params) {
        assert params != null

        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/draft/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.draftInstanceList.size() == 0
        assert model.draftInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.draftInstance != null
    }

    void testSave() {
        controller.save()

        assert model.draftInstance != null
        assert view == '/draft/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/draft/show/1'
        assert controller.flash.message != null
        assert Draft.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/draft/list'


        populateValidParams(params)
        def draft = new Draft(params)

        assert draft.save() != null

        params.id = draft.id

        def model = controller.show()

        assert model.draftInstance == draft
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/draft/list'


        populateValidParams(params)
        def draft = new Draft(params)

        assert draft.save() != null

        params.id = draft.id

        def model = controller.edit()

        assert model.draftInstance == draft
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/draft/list'

        response.reset()


        populateValidParams(params)
        def draft = new Draft(params)

        assert draft.save() != null

        // test invalid parameters in update
        params.id = draft.id


        controller.update()

        assert view == "/draft/edit"
        assert model.draftInstance != null

        draft.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/draft/show/$draft.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        draft.clearErrors()

        populateValidParams(params)
        params.id = draft.id
        params.version = -1
        controller.update()

        assert view == "/draft/edit"
        assert model.draftInstance != null
        assert model.draftInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/draft/list'

        response.reset()

        populateValidParams(params)
        def draft = new Draft(params)

        assert draft.save() != null
        assert Draft.count() == 1

        params.id = draft.id

        controller.delete()

        assert Draft.count() == 0
        assert Draft.get(draft.id) == null
        assert response.redirectedUrl == '/draft/list'
    }
}
