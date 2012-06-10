package mx.com.ideasydiseno.adn

class Estado {

	String nombre

	static belongsTo = [pais: Pais]

	static hasMany = [municipios: Municipio]

    static constraints = {
    	nombre blank:false
    }

    String toString(){
        return "${nombre}"
    }
}
