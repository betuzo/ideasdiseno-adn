package mx.com.ideasydiseno.adn

class Proveedor {

	String nombre
	String descripcion
	Date fechaRegistro
	String direccion
	Colonia colonia
    String codigoPostal
	String telefono1
	String telefono2
	String paginaWeb
    String email1
    String email2

	static hasMany = [productos: ProductoProveedor, contactos: ContactoProveedor]

    static constraints = {
    	nombre blank:false
    	descripcion blank:false
    	fechaRegistro blank:false
    	direccion blank:true
    	colonia nullable:true
        codigoPostal blank:true
    	telefono1 nullable:true
    	telefono2 nullable:true
        paginaWeb nullable:true
        email1 nullable:true
        email2 nullable:true
    }

    String toString(){
        return "${nombre}"
    }
}
