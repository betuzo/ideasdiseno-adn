package mx.com.ideasydiseno.adn



import org.junit.*
import grails.test.mixin.*

@TestFor(ProductoProveedorController)
@Mock(ProductoProveedor)
class ProductoProveedorControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/productoProveedor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.productoProveedorInstanceList.size() == 0
        assert model.productoProveedorInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.productoProveedorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.productoProveedorInstance != null
        assert view == '/productoProveedor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/productoProveedor/show/1'
        assert controller.flash.message != null
        assert ProductoProveedor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/productoProveedor/list'


        populateValidParams(params)
        def productoProveedor = new ProductoProveedor(params)

        assert productoProveedor.save() != null

        params.id = productoProveedor.id

        def model = controller.show()

        assert model.productoProveedorInstance == productoProveedor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/productoProveedor/list'


        populateValidParams(params)
        def productoProveedor = new ProductoProveedor(params)

        assert productoProveedor.save() != null

        params.id = productoProveedor.id

        def model = controller.edit()

        assert model.productoProveedorInstance == productoProveedor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/productoProveedor/list'

        response.reset()


        populateValidParams(params)
        def productoProveedor = new ProductoProveedor(params)

        assert productoProveedor.save() != null

        // test invalid parameters in update
        params.id = productoProveedor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/productoProveedor/edit"
        assert model.productoProveedorInstance != null

        productoProveedor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/productoProveedor/show/$productoProveedor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        productoProveedor.clearErrors()

        populateValidParams(params)
        params.id = productoProveedor.id
        params.version = -1
        controller.update()

        assert view == "/productoProveedor/edit"
        assert model.productoProveedorInstance != null
        assert model.productoProveedorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/productoProveedor/list'

        response.reset()

        populateValidParams(params)
        def productoProveedor = new ProductoProveedor(params)

        assert productoProveedor.save() != null
        assert ProductoProveedor.count() == 1

        params.id = productoProveedor.id

        controller.delete()

        assert ProductoProveedor.count() == 0
        assert ProductoProveedor.get(productoProveedor.id) == null
        assert response.redirectedUrl == '/productoProveedor/list'
    }
}
