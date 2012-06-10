package mx.com.ideasydiseno.adn

class Pago {

	static belongsTo = [venta: Venta]
	
	String concepto
	double totalPago
	Date fechaPago

    static constraints = {
    	venta blank:false
    	concepto blank:false, size:0..300
    	totalPago blank:false
    	fechaPago blank:false
    }

    String toString(){
        return "${totalPago} - ${concepto}"
    }
}
