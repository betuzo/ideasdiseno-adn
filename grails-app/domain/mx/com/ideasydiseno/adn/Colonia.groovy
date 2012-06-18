package mx.com.ideasydiseno.adn

class Colonia {

	String nombreCompleto

	static belongsTo = [municipio: Municipio]

    static constraints = {
    	nombreCompleto blank:false
    }

    String toString(){
        return "${nombreCompleto}, ${municipio}"
    }
}
