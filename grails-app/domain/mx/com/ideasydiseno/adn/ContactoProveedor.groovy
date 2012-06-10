package mx.com.ideasydiseno.adn

class ContactoProveedor extends Persona {

	static belongsTo = [proveedor: Proveedor]

    static constraints = {
    }
}
