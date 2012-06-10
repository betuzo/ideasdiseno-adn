package mx.com.ideasydiseno.adn

class Venta {

	Cliente cliente
	Usuario vendedor
	Date fechaVenta
	Date fechaEntrega
	double totalVenta
	String estado
    String observaciones

	static hasMany = [productos: DetalleVentaProducto,
					  pagos: Pago]

    static constraints = {
     	cliente blank:false
     	vendedor blank:false
    	fechaVenta blank:false
    	fechaEntrega blank:true
    	totalVenta blank:false
    	estado blank:false, inList: ["Abierto", "Cerrado"]
        observaciones blank:false, size:0..50
    }

    String toString(){
        return "${fechaVenta} ${totalVenta}"
    }
}
