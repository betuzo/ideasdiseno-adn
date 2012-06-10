package mx.com.ideasydiseno.adn

class Pais {

	String nombreCorto
	String nombreCompleto

    static hasMany = [estados: Estado]

    static constraints = {
    	nombreCorto blank:false
    	nombreCompleto nullable:true, blank:true
    }

    String toString(){
        return "${nombreCorto}"
    }
}
