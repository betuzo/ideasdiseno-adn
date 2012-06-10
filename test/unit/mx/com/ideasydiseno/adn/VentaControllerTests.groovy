package mx.com.ideasydiseno.adn



import org.junit.*
import grails.test.mixin.*

@TestFor(VentaController)
@Mock(Venta)
class VentaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/venta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ventaInstanceList.size() == 0
        assert model.ventaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.ventaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ventaInstance != null
        assert view == '/venta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/venta/show/1'
        assert controller.flash.message != null
        assert Venta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/venta/list'


        populateValidParams(params)
        def venta = new Venta(params)

        assert venta.save() != null

        params.id = venta.id

        def model = controller.show()

        assert model.ventaInstance == venta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/venta/list'


        populateValidParams(params)
        def venta = new Venta(params)

        assert venta.save() != null

        params.id = venta.id

        def model = controller.edit()

        assert model.ventaInstance == venta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/venta/list'

        response.reset()


        populateValidParams(params)
        def venta = new Venta(params)

        assert venta.save() != null

        // test invalid parameters in update
        params.id = venta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/venta/edit"
        assert model.ventaInstance != null

        venta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/venta/show/$venta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        venta.clearErrors()

        populateValidParams(params)
        params.id = venta.id
        params.version = -1
        controller.update()

        assert view == "/venta/edit"
        assert model.ventaInstance != null
        assert model.ventaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/venta/list'

        response.reset()

        populateValidParams(params)
        def venta = new Venta(params)

        assert venta.save() != null
        assert Venta.count() == 1

        params.id = venta.id

        controller.delete()

        assert Venta.count() == 0
        assert Venta.get(venta.id) == null
        assert response.redirectedUrl == '/venta/list'
    }
}
