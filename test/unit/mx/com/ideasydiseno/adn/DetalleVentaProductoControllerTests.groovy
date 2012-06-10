package mx.com.ideasydiseno.adn



import org.junit.*
import grails.test.mixin.*

@TestFor(DetalleVentaProductoController)
@Mock(DetalleVentaProducto)
class DetalleVentaProductoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/detalleVentaProducto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.detalleVentaProductoInstanceList.size() == 0
        assert model.detalleVentaProductoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.detalleVentaProductoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.detalleVentaProductoInstance != null
        assert view == '/detalleVentaProducto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/detalleVentaProducto/show/1'
        assert controller.flash.message != null
        assert DetalleVentaProducto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleVentaProducto/list'


        populateValidParams(params)
        def detalleVentaProducto = new DetalleVentaProducto(params)

        assert detalleVentaProducto.save() != null

        params.id = detalleVentaProducto.id

        def model = controller.show()

        assert model.detalleVentaProductoInstance == detalleVentaProducto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleVentaProducto/list'


        populateValidParams(params)
        def detalleVentaProducto = new DetalleVentaProducto(params)

        assert detalleVentaProducto.save() != null

        params.id = detalleVentaProducto.id

        def model = controller.edit()

        assert model.detalleVentaProductoInstance == detalleVentaProducto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleVentaProducto/list'

        response.reset()


        populateValidParams(params)
        def detalleVentaProducto = new DetalleVentaProducto(params)

        assert detalleVentaProducto.save() != null

        // test invalid parameters in update
        params.id = detalleVentaProducto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/detalleVentaProducto/edit"
        assert model.detalleVentaProductoInstance != null

        detalleVentaProducto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/detalleVentaProducto/show/$detalleVentaProducto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        detalleVentaProducto.clearErrors()

        populateValidParams(params)
        params.id = detalleVentaProducto.id
        params.version = -1
        controller.update()

        assert view == "/detalleVentaProducto/edit"
        assert model.detalleVentaProductoInstance != null
        assert model.detalleVentaProductoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/detalleVentaProducto/list'

        response.reset()

        populateValidParams(params)
        def detalleVentaProducto = new DetalleVentaProducto(params)

        assert detalleVentaProducto.save() != null
        assert DetalleVentaProducto.count() == 1

        params.id = detalleVentaProducto.id

        controller.delete()

        assert DetalleVentaProducto.count() == 0
        assert DetalleVentaProducto.get(detalleVentaProducto.id) == null
        assert response.redirectedUrl == '/detalleVentaProducto/list'
    }
}
