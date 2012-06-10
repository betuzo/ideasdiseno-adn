package mx.com.ideasydiseno.adn



import org.junit.*
import grails.test.mixin.*

@TestFor(EntradaController)
@Mock(Entrada)
class EntradaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/entrada/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.entradaInstanceList.size() == 0
        assert model.entradaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.entradaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.entradaInstance != null
        assert view == '/entrada/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/entrada/show/1'
        assert controller.flash.message != null
        assert Entrada.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/entrada/list'


        populateValidParams(params)
        def entrada = new Entrada(params)

        assert entrada.save() != null

        params.id = entrada.id

        def model = controller.show()

        assert model.entradaInstance == entrada
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/entrada/list'


        populateValidParams(params)
        def entrada = new Entrada(params)

        assert entrada.save() != null

        params.id = entrada.id

        def model = controller.edit()

        assert model.entradaInstance == entrada
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/entrada/list'

        response.reset()


        populateValidParams(params)
        def entrada = new Entrada(params)

        assert entrada.save() != null

        // test invalid parameters in update
        params.id = entrada.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/entrada/edit"
        assert model.entradaInstance != null

        entrada.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/entrada/show/$entrada.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        entrada.clearErrors()

        populateValidParams(params)
        params.id = entrada.id
        params.version = -1
        controller.update()

        assert view == "/entrada/edit"
        assert model.entradaInstance != null
        assert model.entradaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/entrada/list'

        response.reset()

        populateValidParams(params)
        def entrada = new Entrada(params)

        assert entrada.save() != null
        assert Entrada.count() == 1

        params.id = entrada.id

        controller.delete()

        assert Entrada.count() == 0
        assert Entrada.get(entrada.id) == null
        assert response.redirectedUrl == '/entrada/list'
    }
}
