package mx.com.ideasydiseno.adn

class ProductoProveedor {

	Producto producto
	Proveedor proveedor
	double precio
	String ventajas
	String desventajas
	boolean esProveedorOficial

    static constraints = {
    	producto nullable:true
    	proveedor nullable:true
		precio blank:false
		ventajas nullable:true, size:0..1000
		desventajas nullable:true, size:0..1000
		esProveedorOficial blank:false
    }

    String toString(){
        return "${producto} - ${proveedor}: ${precio}"
    }
}
