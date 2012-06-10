package mx.com.ideasydiseno.adn



import org.junit.*
import grails.test.mixin.*

@TestFor(ColoniaController)
@Mock(Colonia)
class ColoniaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/colonia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.coloniaInstanceList.size() == 0
        assert model.coloniaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.coloniaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.coloniaInstance != null
        assert view == '/colonia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/colonia/show/1'
        assert controller.flash.message != null
        assert Colonia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/colonia/list'


        populateValidParams(params)
        def colonia = new Colonia(params)

        assert colonia.save() != null

        params.id = colonia.id

        def model = controller.show()

        assert model.coloniaInstance == colonia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/colonia/list'


        populateValidParams(params)
        def colonia = new Colonia(params)

        assert colonia.save() != null

        params.id = colonia.id

        def model = controller.edit()

        assert model.coloniaInstance == colonia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/colonia/list'

        response.reset()


        populateValidParams(params)
        def colonia = new Colonia(params)

        assert colonia.save() != null

        // test invalid parameters in update
        params.id = colonia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/colonia/edit"
        assert model.coloniaInstance != null

        colonia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/colonia/show/$colonia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        colonia.clearErrors()

        populateValidParams(params)
        params.id = colonia.id
        params.version = -1
        controller.update()

        assert view == "/colonia/edit"
        assert model.coloniaInstance != null
        assert model.coloniaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/colonia/list'

        response.reset()

        populateValidParams(params)
        def colonia = new Colonia(params)

        assert colonia.save() != null
        assert Colonia.count() == 1

        params.id = colonia.id

        controller.delete()

        assert Colonia.count() == 0
        assert Colonia.get(colonia.id) == null
        assert response.redirectedUrl == '/colonia/list'
    }
}
