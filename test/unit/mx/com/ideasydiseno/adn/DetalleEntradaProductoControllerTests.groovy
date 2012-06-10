package mx.com.ideasydiseno.adn



import org.junit.*
import grails.test.mixin.*

@TestFor(DetalleEntradaProductoController)
@Mock(DetalleEntradaProducto)
class DetalleEntradaProductoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/detalleEntradaProducto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.detalleEntradaProductoInstanceList.size() == 0
        assert model.detalleEntradaProductoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.detalleEntradaProductoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.detalleEntradaProductoInstance != null
        assert view == '/detalleEntradaProducto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/detalleEntradaProducto/show/1'
        assert controller.flash.message != null
        assert DetalleEntradaProducto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleEntradaProducto/list'


        populateValidParams(params)
        def detalleEntradaProducto = new DetalleEntradaProducto(params)

        assert detalleEntradaProducto.save() != null

        params.id = detalleEntradaProducto.id

        def model = controller.show()

        assert model.detalleEntradaProductoInstance == detalleEntradaProducto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleEntradaProducto/list'


        populateValidParams(params)
        def detalleEntradaProducto = new DetalleEntradaProducto(params)

        assert detalleEntradaProducto.save() != null

        params.id = detalleEntradaProducto.id

        def model = controller.edit()

        assert model.detalleEntradaProductoInstance == detalleEntradaProducto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleEntradaProducto/list'

        response.reset()


        populateValidParams(params)
        def detalleEntradaProducto = new DetalleEntradaProducto(params)

        assert detalleEntradaProducto.save() != null

        // test invalid parameters in update
        params.id = detalleEntradaProducto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/detalleEntradaProducto/edit"
        assert model.detalleEntradaProductoInstance != null

        detalleEntradaProducto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/detalleEntradaProducto/show/$detalleEntradaProducto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        detalleEntradaProducto.clearErrors()

        populateValidParams(params)
        params.id = detalleEntradaProducto.id
        params.version = -1
        controller.update()

        assert view == "/detalleEntradaProducto/edit"
        assert model.detalleEntradaProductoInstance != null
        assert model.detalleEntradaProductoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/detalleEntradaProducto/list'

        response.reset()

        populateValidParams(params)
        def detalleEntradaProducto = new DetalleEntradaProducto(params)

        assert detalleEntradaProducto.save() != null
        assert DetalleEntradaProducto.count() == 1

        params.id = detalleEntradaProducto.id

        controller.delete()

        assert DetalleEntradaProducto.count() == 0
        assert DetalleEntradaProducto.get(detalleEntradaProducto.id) == null
        assert response.redirectedUrl == '/detalleEntradaProducto/list'
    }
}
