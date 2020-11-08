import Jaloguin.*

class Legion {
	var property miembros
	
	method capacidadDeAsustar(){
		return miembros.sum({ninio => ninio.capacidadDeAsustar()})
	}
	
	method bolsaDeCaramelos(){
		return miembros.sum({ninio => ninio.bolsaDeCaramelos()})
	}
	
	method obtenerLider(){
		return miembros.max({ninio => ninio.capacidadDeAsustar()})
	}
	
	method asustarAdulto(unAdulto){
		const lider = self.obtenerLider()
		miembros.forEach({ninio => lider.agregarCaramelos(ninio.asustarAdulto(unAdulto))})
	}
	
	method esValida(){
		if (miembros.size() >= 2){
			return true
		} else if(miembros.size() == 1){
			return miembros.esValida()
		}
		else throw new NoEsValidaException(message="No Tiene al menos 2 ninios la legion, no es valida.")
	}
}

// Punto 3  -> Si se puede, gracias al polimorfismo donde legion y ninios entienden los mismos mensajes.


class NoEsValidaException inherits Exception{}