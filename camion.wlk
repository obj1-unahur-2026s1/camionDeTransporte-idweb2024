
object camion {
    var carga = []

    method cargarCamionCon(unaCosa) {
     if (self.pesoTotal() + unaCosa.peso() <= self.maximoPermitido())
        carga.add(unaCosa)
    }

    method pesoPropio() = 1000
    method maximoPermitido() = 2500

    method sonPares() = carga.all({c => c.peso() % 2 == 0})

    method hayCosaConPeso(unPeso) {
        return carga.any({c => c.peso() == unPeso})
    } 

    method primerObjetoDePeligrosidad(unValor) {
        return carga.find({c => c.nivelDePeligrosidad() == unValor})
    } 

    method objetosConNivelDePeligro(unValor) {
        return carga.filter({c => c.nivelDePeligrosidad() > unValor})
    }

    method estaExcedido() {
        return self.pesoTotal() > self.maximoPermitido()
    } 

    method pesoTotal() = self.pesoPropio() + self.pesoTotalDeLaCarga() 

    method pesoTotalDeLaCarga() {
        return carga.sum({c => c.peso()})
    } 

    method puedeCircular(unValor) =
        !self.estaExcedido() and
        carga.all({c => c.nivelDePeligrosidad() <= unValor})

    method hayCosasConPesoEntre(valorMin, valorMax) =
        carga.any({c => c.peso().between(valorMin, valorMax)})

    method cosaMasPesada() = carga.max({c => c.peso()})


} 
