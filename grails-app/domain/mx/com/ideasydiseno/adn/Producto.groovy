package mx.com.ideasydiseno.adn

class Producto {

	String nombre
	String descripcion
	double precioSugerido
	boolean esVenta

	static hasMany = [proveedores: ProductoProveedor]

    static constraints = {
    	nombre blank:false
    	descripcion blank:false
    	precioSugerido blank:false
    	esVenta blank:false
    }

	String toString(){
        return "${nombre}: ${precioSugerido}"
    }
}
