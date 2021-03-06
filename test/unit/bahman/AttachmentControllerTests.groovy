package bahman



import org.junit.*
import grails.test.mixin.*

@TestFor(AttachmentController)
@Mock(Attachment)
class AttachmentControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/attachment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.attachmentInstanceList.size() == 0
        assert model.attachmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.attachmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.attachmentInstance != null
        assert view == '/attachment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/attachment/show/1'
        assert controller.flash.message != null
        assert Attachment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/attachment/list'


        populateValidParams(params)
        def attachment = new Attachment(params)

        assert attachment.save() != null

        params.id = attachment.id

        def model = controller.show()

        assert model.attachmentInstance == attachment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/attachment/list'


        populateValidParams(params)
        def attachment = new Attachment(params)

        assert attachment.save() != null

        params.id = attachment.id

        def model = controller.edit()

        assert model.attachmentInstance == attachment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/attachment/list'

        response.reset()


        populateValidParams(params)
        def attachment = new Attachment(params)

        assert attachment.save() != null

        // test invalid parameters in update
        params.id = attachment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/attachment/edit"
        assert model.attachmentInstance != null

        attachment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/attachment/show/$attachment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        attachment.clearErrors()

        populateValidParams(params)
        params.id = attachment.id
        params.version = -1
        controller.update()

        assert view == "/attachment/edit"
        assert model.attachmentInstance != null
        assert model.attachmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/attachment/list'

        response.reset()

        populateValidParams(params)
        def attachment = new Attachment(params)

        assert attachment.save() != null
        assert Attachment.count() == 1

        params.id = attachment.id

        controller.delete()

        assert Attachment.count() == 0
        assert Attachment.get(attachment.id) == null
        assert response.redirectedUrl == '/attachment/list'
    }
}
