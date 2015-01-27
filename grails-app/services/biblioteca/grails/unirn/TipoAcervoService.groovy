package biblioteca.grails.unirn

import grails.transaction.Transactional

@Transactional
class TipoAcervoService {

    def buscarDadosPorDescricao(descricao) {
		TipoAcervo.findAllByNomeIlike("%${descricao}%")
    }
}
