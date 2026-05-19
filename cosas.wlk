import transforYMisiles.* 


object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10

    method bultosQueOcupan() = 1
    method reaccionarAlSerCargado() { }  // no hace nada, pero responde al mensaje

}

object bumblebee {
    var transformacion = robot
    method peso() = 800
    
    method nivelDePeligrosidad() {
        return transformacion.nivelDePeligrosidad()
    }

    method transformar(tipo) {
      transformacion = tipo
    }

    method bultosQueOcupan() = 2
    method reaccionarAlSerCargado() { self.transformar(robot) }

}

object ladrillo {
  method peso() = 2

}

object paqueteDeLadrillos {
    var ladrillos = []
    method agregarLadrillos(unValor) {
        // aca revisar bien si puedo usar este metodo o debo usar un forEach
        unValor.times({i => ladrillos.add(ladrillo)})
    }

    method cantidad() = ladrillos.size()
    method peso() = self.cantidad() * ladrillo.peso()
    method nivelDePeligrosidad() = 2

    method bultosQueOcupan() {
        if (self.cantidad() <= 100) {
            return 1
        } else if (self.cantidad().between(101, 300)) {
            return 2
        } else {
            return 3
        }
    }

    method reaccionarAlSerCargado() { self.agregarLadrillos(12) }

}

object arenaAGranel {
  var peso = 0
  method nivelDePeligrosidad() = 1  
  method bultosQueOcupan() = 1

    method peso() {
        return peso
    } 

  method aumetarPeso(unValor) {
    peso += unValor
  }

  method disminuirPeso(unValor) {
    peso -= unValor
  }

    method reaccionarAlSerCargado() { self.disminuirPeso(10) }

}

object bateriaAntiaerea {
  var misiles = false
  method peso() {
    if (self.misilesActivados()) {
       return misil.peso() 
    } 
        return 200
  }

  method misilesActivados() = misiles
  method activarMisiles() {
    misiles = true
  } 

  method nivelDePeligrosidad() {
    if (self.misilesActivados()) {
        return misil.nivelDePeligrosidad()
    }
        return 0
  } 

    method bultosQueOcupan() {
        if (self.misilesActivados()) {
            return 2
        } else {
            return 1
        }
    }

    method reaccionarAlSerCargado() { self.activarMisiles() }

  
}

object contenedorPortuario {
  var almacenamiento = []

  method peso() {
    return 100 + almacenamiento.sum({a => a.peso()})
  }

  method nivelDePeligrosidad() {
    if (almacenamiento.size() == 0) {
        return 0
    } 
    return almacenamiento.max({a => a.nivelDePeligrosidad()}).nivelDePeligrosidad()

  } 

   method agregarCosas(unaCosa) {
    almacenamiento.add(unaCosa)
   }

   method bultosQueOcupan() {
    return 1 + almacenamiento.sum({a => a.bultosQueOcupan()})
   }

    method reaccionarAlSerCargado() {
        almacenamiento.forEach({ a => a.reaccionarAlSerCargado() })
    }
}

object residuosRadeactivos {
    var peso = 0
    method peso() {
        return peso
    }
    method nivelDePeligrosidad() = 200
    method bultosQueOcupan() = 1

    method aumentarPeso(unValor) {
      peso += unValor
    }

    method disminuirPeso(unValor) {
        peso -= unValor
    }

    method reaccionarAlSerCargado() { self.aumentarPeso(15) }

}

object embalajeDeSeguridad {
    var contenido = null
    method peso() = contenido.peso()
    method nivelDePeligrosidad() = contenido.nivelDePeligrosidad() / 2
    method agregarCoberturaA(unaCosa) { contenido = unaCosa }
    method bultosQueOcupan() = 2

    method reaccionarAlSerCargado() { }
}
