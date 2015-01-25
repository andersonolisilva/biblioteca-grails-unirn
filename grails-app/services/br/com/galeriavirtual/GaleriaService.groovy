package br.com.galeriavirtual

import br.com.biblioteca.Galeria;
import grails.transaction.Transactional

@Transactional
class GaleriaService {

    def buscarDadosPorNome(nome) {
		Galeria.findAllbyNomeIlike("%${nome}%")
    }
}
