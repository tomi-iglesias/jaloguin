import Adulto.*

class Ninio{
	var property actitud
	var property elementos
	var bolsaDeCaramelos
	var property estado

	method bolsaDeCaramelos() = bolsaDeCaramelos
	
	method capacidadDeAsustar(){
		return self.sumatoriaDeSusto() * actitud
	}
	
	method disminuirActitud(unaCantidad){
		actitud -= unaCantidad		
	}
	
	method sumatoriaDeSusto(){
		return elementos.sum({unElemento => unElemento.susto()}) 
	}
	
	method asustarAdulto(adulto){
		if (estado.puedeAsustar()){
			return adulto.esAsustado(self)	
		} else throw new NinioNoPuedeAsustarException(message="No puede xq esta en cama")
		
	}
	
	method agregarCaramelos(adulto){
		bolsaDeCaramelos += self.asustarAdulto(adulto)
	}
	
	method comerCaramelos(unaCantidad){
		if (estado.puedeComerCaramelos()){
			if (bolsaDeCaramelos >= unaCantidad){
				bolsaDeCaramelos -= unaCantidad
				if(unaCantidad > 9){ 
					estado.cambiarDeEstado(self)
				}	
			} else throw new NinioGlotonException(message = "El Ninio quiere comerse mas de los caramelos que tiene")
		} else throw new NinioGlotonException(message= "El ninio esta en cama y no puede comer caramelos")
	}
}

object salud{
	method cambiarDeEstado(unNinio){
		unNinio.estado(empachado)
		unNinio.disminuirActitud(10)
	}
	
	method intentarComerCaramelos(unNinio, unaCantidad){
		unNinio.comerCaramelos(unaCantidad)
	}
	
	method puedeAsustar() = true
	
	method puedeComerCaramelos() = true
}

object empachado{
	method cambiarDeEstado(unNinio){
		unNinio.estado(enCama)
		unNinio.actitud(0)
	}
	
	method puedeAsustar() = true
	
	method puedeComerCaramelos() = true
}

object enCama{
	method cambiarDeEstado(unNinio){}
	
	method puedeAsustar() = false
	
	method puedeComerCaramelos() = false
}

class Maquillaje{
	var property susto
}

class Tierno{
	var property susto
}

class Terrofico{
	var property susto
}

const winnieDePooh = new Tierno(susto = 2)
const sullivan = new Tierno(susto = 2)
const jason = new Terrofico(susto = 5)
const georgeBush = new Terrofico(susto = 5)

class NinioGlotonException inherits Exception{}
class NinioNoPuedeAsustarException inherits Exception{}

