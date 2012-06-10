package mx.com.ideasydiseno.adn

class DetalleVentaProducto {

	static belongsTo = [venta: Venta]
	Producto producto
	int cantidad
	double totalProducto

    static constraints = {
    	producto blank:false
    	cantidad blank:false
    	totalProducto blank:false
    }

    String toString(){
        return "${producto} ${totalProducto}"
    }
}
