package mx.com.ideasydiseno.adn

class Cliente extends Persona{

	static hasMany = [compras: Venta]

    static constraints = {
    }
}
