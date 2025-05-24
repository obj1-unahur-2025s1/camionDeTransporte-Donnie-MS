object camion {
    const cosas = []
    method pesoTotal() {
        return 1000 + self.cargaTotal()
    }
    method cargaTotal() = cosas.sum({c=>c.peso()})
    method cargar(unaCosa) {
        cosas.add(unaCosa)
    }
    method descargar(unaCosa) {
        cosas.remove(unaCosa)
    }
    method todosPesoPar() {
        cosas.all({cosa => cosa.peso() % 2 == 0})
    }
    method hayCosaConPesoDe(valor) {
        cosas.any({cosa => cosa.peso() == valor})
    }
    method hayCosaConPeligrosidad(valor) {
        cosas.find({cosa => cosa.peligrosidad() == valor})
    }
    method cosasSuperanPeligrosidad(valor) {
        return cosas.filter({cosa => cosa.peligrosidad() > valor})
    }
    method cosasMasPeligrosasQue(unaCosa) = self.cosasSuperanPeligrosidad(unaCosa.peligrosidad())
    method estaExcedidoDePeso() {
        return 2500 > self.pesoTotal()
    }
    method puedeCircularEnRuta(peligrosidad) {
        return not self.estaExcedidoDePeso() and self.cosasSuperanPeligrosidad(peligrosidad).isEmpty()
    }
    method tieneAlgoQuePesaEntre(min,max) = cosas.any({e=>e.peso().between(min, max)})
}
object tara {
    method peso() = 1000
}