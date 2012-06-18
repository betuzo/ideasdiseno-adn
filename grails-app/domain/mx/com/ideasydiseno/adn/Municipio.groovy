package mx.com.ideasydiseno.adn

class Municipio {

	String nombreCorto
	String nombreCompleto

	static belongsTo = [estado: Estado]

	static hasMany = [colonias: Colonia]

    static constraints = {
    	nombreCorto blank:false
    	nombreCompleto nullable:true, blank:true
    }

    String toString(){
        return "${nombreCorto}, ${estado}"
    }
}
