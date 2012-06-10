package mx.com.ideasydiseno.adn



import org.junit.*
import grails.test.mixin.*

@TestFor(PagoController)
@Mock(Pago)
class PagoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pago/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pagoInstanceList.size() == 0
        assert model.pagoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.pagoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pagoInstance != null
        assert view == '/pago/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pago/show/1'
        assert controller.flash.message != null
        assert Pago.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pago/list'


        populateValidParams(params)
        def pago = new Pago(params)

        assert pago.save() != null

        params.id = pago.id

        def model = controller.show()

        assert model.pagoInstance == pago
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pago/list'


        populateValidParams(params)
        def pago = new Pago(params)

        assert pago.save() != null

        params.id = pago.id

        def model = controller.edit()

        assert model.pagoInstance == pago
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pago/list'

        response.reset()


        populateValidParams(params)
        def pago = new Pago(params)

        assert pago.save() != null

        // test invalid parameters in update
        params.id = pago.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pago/edit"
        assert model.pagoInstance != null

        pago.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pago/show/$pago.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pago.clearErrors()

        populateValidParams(params)
        params.id = pago.id
        params.version = -1
        controller.update()

        assert view == "/pago/edit"
        assert model.pagoInstance != null
        assert model.pagoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pago/list'

        response.reset()

        populateValidParams(params)
        def pago = new Pago(params)

        assert pago.save() != null
        assert Pago.count() == 1

        params.id = pago.id

        controller.delete()

        assert Pago.count() == 0
        assert Pago.get(pago.id) == null
        assert response.redirectedUrl == '/pago/list'
    }
}
