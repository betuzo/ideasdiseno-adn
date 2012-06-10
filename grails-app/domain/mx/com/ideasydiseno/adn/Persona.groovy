package mx.com.ideasydiseno.adn

class Persona {

	String nombre
	String apellidoPaterno
	String apellidoMaterno
	Date fechaNacimiento
	String sexo
	String direccion
	Colonia colonia
    String codigoPostal
	String telefono
	String email

    static transients = ['nombreCompleto']

    String getNombreCompleto(){
        return "${nombre} ${apellidoPaterno}"
    }

    static constraints = {
    	nombre blank:false
    	apellidoPaterno blank:false
    	apellidoMaterno blank:true, nullable:true
    	sexo blank:false, inList: ["Femenino", "Masculino"]
    	fechaNacimiento blank:false
    	direccion blank:false
    	colonia nullable:false
        codigoPostal blank:false
    	telefono nullable:true
    	email email:true, blank:false
    }

    String toString(){
        return getNombreCompleto()
    }
}
