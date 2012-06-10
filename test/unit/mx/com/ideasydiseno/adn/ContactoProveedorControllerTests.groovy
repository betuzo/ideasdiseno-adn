package mx.com.ideasydiseno.adn



import org.junit.*
import grails.test.mixin.*

@TestFor(ContactoProveedorController)
@Mock(ContactoProveedor)
class ContactoProveedorControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contactoProveedor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contactoProveedorInstanceList.size() == 0
        assert model.contactoProveedorInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.contactoProveedorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contactoProveedorInstance != null
        assert view == '/contactoProveedor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contactoProveedor/show/1'
        assert controller.flash.message != null
        assert ContactoProveedor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contactoProveedor/list'


        populateValidParams(params)
        def contactoProveedor = new ContactoProveedor(params)

        assert contactoProveedor.save() != null

        params.id = contactoProveedor.id

        def model = controller.show()

        assert model.contactoProveedorInstance == contactoProveedor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contactoProveedor/list'


        populateValidParams(params)
        def contactoProveedor = new ContactoProveedor(params)

        assert contactoProveedor.save() != null

        params.id = contactoProveedor.id

        def model = controller.edit()

        assert model.contactoProveedorInstance == contactoProveedor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contactoProveedor/list'

        response.reset()


        populateValidParams(params)
        def contactoProveedor = new ContactoProveedor(params)

        assert contactoProveedor.save() != null

        // test invalid parameters in update
        params.id = contactoProveedor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contactoProveedor/edit"
        assert model.contactoProveedorInstance != null

        contactoProveedor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contactoProveedor/show/$contactoProveedor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contactoProveedor.clearErrors()

        populateValidParams(params)
        params.id = contactoProveedor.id
        params.version = -1
        controller.update()

        assert view == "/contactoProveedor/edit"
        assert model.contactoProveedorInstance != null
        assert model.contactoProveedorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contactoProveedor/list'

        response.reset()

        populateValidParams(params)
        def contactoProveedor = new ContactoProveedor(params)

        assert contactoProveedor.save() != null
        assert ContactoProveedor.count() == 1

        params.id = contactoProveedor.id

        controller.delete()

        assert ContactoProveedor.count() == 0
        assert ContactoProveedor.get(contactoProveedor.id) == null
        assert response.redirectedUrl == '/contactoProveedor/list'
    }
}
