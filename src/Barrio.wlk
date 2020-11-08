import Jaloguin.*

class Barrio {
	var property ninios
	
	method top3Ninios(){
		return (ninios.sortedBy({unNinio, otroNinio => unNinio.bolsaDeCaramelos() > otroNinio.bolsaDeCaramelos()}).take(3))
	}
	
	method elementosConMasDeDiezCaramelos(){
		const unosNinios = ninios.filter({unNinio => unNinio.bolsaDeCaramelos() > 10})
		return (unosNinios.flatMap({unNinio => unNinio.elementos()}).asSet())
	}
}
