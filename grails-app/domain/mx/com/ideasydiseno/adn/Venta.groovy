package mx.com.ideasydiseno.adn

class Venta {

    transient springSecurityService

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
        observaciones blank:true, size:0..50
    }

    String toString(){
        def formattedDate = fechaVenta.format('yyyy-MM-dd')
        return "Foio: ${id} - ${formattedDate}  ${totalVenta}"
    }

    def usuarioLoggedIn() {
        def user = springSecurityService?.currentUser
        if (user==null){
            return Usuario.list()
        }else{
            return Usuario.findByUsername(user.username)
        }
    }
}
