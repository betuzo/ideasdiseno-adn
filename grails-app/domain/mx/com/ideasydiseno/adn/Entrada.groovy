package mx.com.ideasydiseno.adn

class Entrada {

	Usuario empleado
	Date fechaSolicitud
	Date fechaRecepcion
	double totalEntrada
	String estado
    String observaciones

	static hasMany = [productos: DetalleEntradaProducto]

    static constraints = {
    	empleado blank:false
    	fechaSolicitud blank:false
    	fechaSolicitud blank:true
    	totalEntrada blank:false
    	estado blank:false, inList: ["Abierto", "Cerrado"]
        observaciones blank:true, size:0..50
    }

    String toString(){
        return "${fechaSolicitud} ${totalEntrada}"
    }
}
