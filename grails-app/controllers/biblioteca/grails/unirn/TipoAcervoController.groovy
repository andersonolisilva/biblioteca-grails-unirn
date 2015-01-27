package biblioteca.grails.unirn



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

class TipoAcervoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoAcervo.list(params), model:[tipoAcervoInstanceCount: TipoAcervo.count()]
    }
	
	/*def index() {
		def lista = TipoAcervo.list()
		render(view:"/tipoAcervo/index", model: [tipoAcervoInstanceList: lista])
	}*/
	
	def adicionar() {
		TipoAcervo novoTipoAcervoInstance = new TipoAcervo()
		render(template:"/tipoAcervo/form", model: [tipoAcervoInstance: novoTipoAcervoInstance])
	}
	
	def salvar() {
		TipoAcervo tipoAcervoInstance = null
		if (params.id)
		{
			tipoAcervoInstance = TipoAcervo.get(params.id)
		}else{
			tipoAcervoInstance = new TipoAcervo()
		}
		tipoAcervoInstance.descricao = params.descricao
		
		tipoAcervoInstance.validate()
		if(!tipoAcervoInstance.hasErrors()){
			tipoAcervoInstance.save(flush:true)
			render("Salvou!!")
		}else{
			render("Ops.. Lascou!")
		}
	}
	
	def search() {}
	
	def doSearch() {
		return[tipoAcervoInstanceList: tipoAcervoInstanceList.findAllByNomeLike("%"+params.descricao+"%")]
	}
	
	def listar(String descricao){
		render tipoAcervoService.buscarDadosPorDescricao(descricao) as JSON
	}
	
	def lista() {
		def lista = TipoAcervo.list()
		render(template:"/tipoAcervo/lista", model:[tipoAcervoInstanceList: lista])
	}
	
	def alterar() {
		TipoAcervo tipoAcervoInstance = TipoAcervo.get(params.id)
		render(template:"/tipoAcervo/form", model: [tipoAcervoInstance: tipoAcervoInstance])
	}
	
	def excluir() {
		TipoAcervo tipoAcervoInstance = TipoAcervo.get(params.id)
		tipoAcervoInstance.delete(flush:true)
		
		def lista = TipoAcervo.list()
		render(template:"/tipoAcervo/lista", model:[tipoAcervoInstanceList: lista])
	}

    def show(TipoAcervo tipoAcervoInstance) {
        respond tipoAcervoInstance
    }

    def create() {
        // respond new TipoAcervo(params)

		TipoAcervo novoTipoAcervoInstance = new TipoAcervo()
		render(template:"/tipoAcervo/form", model: [tipoAcervo: novoTipoAcervoInstance])
    }

    @Transactional
    def save(TipoAcervo tipoAcervoInstance) {
        if (tipoAcervoInstance == null) {
            notFound()
            return
        }

        if (tipoAcervoInstance.hasErrors()) {
            respond tipoAcervoInstance.errors, view:'create'
            return
        }

        tipoAcervoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoAcervo.label', default: 'TipoAcervo'), tipoAcervoInstance.id])
                // redirect action: "index", method: "GET"
				
				render(template:"/tipoAcervo/form", model: [tipoAcervo: tipoAcervoInstance])
            }
            '*' { respond tipoAcervoInstance, [status: CREATED] }
        }
    }

    def edit(TipoAcervo tipoAcervoInstance) {
        respond tipoAcervoInstance
    }

    @Transactional
    def update(TipoAcervo tipoAcervoInstance) {
        if (tipoAcervoInstance == null) {
            notFound()
            return
        }

        if (tipoAcervoInstance.hasErrors()) {
            respond tipoAcervoInstance.errors, view:'edit'
            return
        }

        tipoAcervoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoAcervo.label', default: 'TipoAcervo'), tipoAcervoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*'{ respond tipoAcervoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoAcervo tipoAcervoInstance) {

        if (tipoAcervoInstance == null) {
            notFound()
            return
        }

        tipoAcervoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoAcervo.label', default: 'TipoAcervo'), tipoAcervoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAcervo.label', default: 'TipoAcervo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
