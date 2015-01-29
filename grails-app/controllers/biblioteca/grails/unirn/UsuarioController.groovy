package biblioteca.grails.unirn



import static org.springframework.http.HttpStatus.*
@Transactional(readOnly = true)
import grails.transaction.Transactional

class UsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.listOrderByNome(params, order: "asc"), model:[usuarioInstanceCount: Usuario.count()]
    }
	
	def adicionar() {
		Usuario novoUsuarioInstance = new Usuario()
		render(template:"/usuario/form", model: [usuarioInstance: novoUsuarioInstance])
	}
	
	def salvar() {
		Usuario usuarioInstance = null
		if (params.id)
		{
			usuarioInstance = Usuario.get(params.id)
		}else{
			usuarioInstance = new Usuario()
		}
		usuarioInstance.email = params.email
		usuarioInstance.nome = params.nome
		usuarioInstance.senha = params.senha
		
		usuarioInstance.validate()
		if(!usuarioInstance.hasErrors()){
			usuarioInstance.save(flush:true)
			render("Salvou!!")
		}else{
			render("Ops.. Lascou!")
		}
	}
	
	def doSearch = {	
		[usuarioInstanceList: Usuario.findAllByNomeIlike("%${params.nome}%", [order: "asc"])]
	}
	
	def outraBusca = {
		[usuarioInstanceList: Usuario.findAllByNomeIlike("%${params.nome}%", [order: "asc"])]
	}
	
	def lista() {
		def lista = Usuario.listOrderByNome(order: "asc")
		render(template:"/usuario/lista", model:[usuarioInstanceList: lista])
	}
	
	def alterar() {
		Usuario usuarioInstance = Usuario.get(params.id)
		render(template:"/usuario/form", model: [usuarioInstance: usuarioInstance])
	}
	
	def excluir() {
		Usuario usuarioInstance = Usuario.get(params.id)
		usuarioInstance.delete(flush:true)
		
		def lista = Usuario.listOrderByNome(order: "asc")
		render(template:"/usuario/lista", model:[usuarioInstanceList: lista])
	}

    def show(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    def create() {
        respond new Usuario(params)
    }

    @Transactional
    def save(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'create'
            return
        }

        usuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
    }

    def edit(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Transactional
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'edit'
            return
        }

        usuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*'{ respond usuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        usuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
