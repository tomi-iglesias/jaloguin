
class AdultoComun{	
	var property niniosQueQuisieronAsustarlo
	
	method niniosQueAsustaronConMasDe15Caramelos(){
		return niniosQueQuisieronAsustarlo.filter({ninio => ninio.bolsaDeCaramelos() > 15}).size()
	}
	
	method esAsustado(ninio){
		niniosQueQuisieronAsustarlo.add(ninio)
		if (self.tolerancia() < ninio.capacidadDeAsustar()){
			return self.tolerancia() / 2
		} else return 0
	}
	
	method tolerancia(){
		return (10 * self.niniosQueAsustaronConMasDe15Caramelos())
	}
}

class Abuelo inherits AdultoComun{
	override method esAsustado(ninio){
		return super(ninio) / 2
	}
}

class AdultoNecio{
	method esAsustado(ninio){
		return 0
	}
}