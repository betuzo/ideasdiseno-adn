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

	static hasMany = [productos: ProductoProveedor, contactos: ContactoProveedor]

    static constraints = {
    	nombre blank:false
    	descripcion blank:false
    	fechaRegistro blank:false
    	direccion blank:false
    	colonia nullable:false
        codigoPostal blank:false
    	telefono1 nullable:true
    	telefono2 nullable:true
    }

    String toString(){
        return "${nombre}"
    }
}
