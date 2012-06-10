package mx.com.ideasydiseno.adn



import org.junit.*
import grails.test.mixin.*

@TestFor(PaisController)
@Mock(Pais)
class PaisControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pais/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.paisInstanceList.size() == 0
        assert model.paisInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.paisInstance != null
    }

    void testSave() {
        controller.save()

        assert model.paisInstance != null
        assert view == '/pais/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pais/show/1'
        assert controller.flash.message != null
        assert Pais.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pais/list'


        populateValidParams(params)
        def pais = new Pais(params)

        assert pais.save() != null

        params.id = pais.id

        def model = controller.show()

        assert model.paisInstance == pais
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pais/list'


        populateValidParams(params)
        def pais = new Pais(params)

        assert pais.save() != null

        params.id = pais.id

        def model = controller.edit()

        assert model.paisInstance == pais
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pais/list'

        response.reset()


        populateValidParams(params)
        def pais = new Pais(params)

        assert pais.save() != null

        // test invalid parameters in update
        params.id = pais.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pais/edit"
        assert model.paisInstance != null

        pais.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pais/show/$pais.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pais.clearErrors()

        populateValidParams(params)
        params.id = pais.id
        params.version = -1
        controller.update()

        assert view == "/pais/edit"
        assert model.paisInstance != null
        assert model.paisInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pais/list'

        response.reset()

        populateValidParams(params)
        def pais = new Pais(params)

        assert pais.save() != null
        assert Pais.count() == 1

        params.id = pais.id

        controller.delete()

        assert Pais.count() == 0
        assert Pais.get(pais.id) == null
        assert response.redirectedUrl == '/pais/list'
    }
}
