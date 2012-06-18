package mx.com.ideasydiseno.adn

class Cliente {

	String nombre
	String apellidoPaterno
	String apellidoMaterno
	String sexo
	Date fechaNacimiento
	String direccion
	Colonia colonia
    String codigoPostal
	String telefono
	String email

    static transients = ['nombreCompleto']

    static hasMany = [compras: Venta]

    String getNombreCompleto(){
        return "${nombre} ${apellidoPaterno}"
    }

    static constraints = {
    	nombre blank:false
    	apellidoPaterno blank:false
    	apellidoMaterno blank:true, nullable:true
    	sexo blank:false, inList: ["Femenino", "Masculino"]
    	fechaNacimiento blank:true, nullable:true
    	direccion blank:true, nullable:true
    	colonia blank:true, nullable:true
        codigoPostal blank:true, nullable:true
    	telefono blank:false
    	email email:true, blank:true, nullable:true
    }

    String toString(){
        return getNombreCompleto()
    }
}
