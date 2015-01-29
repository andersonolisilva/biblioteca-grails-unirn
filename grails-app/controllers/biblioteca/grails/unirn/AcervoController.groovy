package biblioteca.grails.unirn



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Transactional(readOnly = true)
class AcervoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Acervo.listOrderByTitulo(params, order: "asc"), model:[acervoInstanceCount: Acervo.count()]
    }
	
	def show(Acervo acervoInstance) {
        respond acervoInstance
    }

    def create() {
        respond new Acervo(params)
    }

    @Transactional
    def save(Acervo acervoInstance) {
        if (acervoInstance == null) {
            notFound()
            return
        }

        if (acervoInstance.hasErrors()) {
            respond acervoInstance.errors, view:'create'
            return
        }

        acervoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'acervo.label', default: 'Acervo'), acervoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond acervoInstance, [status: CREATED] }
        }
    }

    def edit(Acervo acervoInstance) {
        respond acervoInstance
    }

    @Transactional
    def update(Acervo acervoInstance) {
        if (acervoInstance == null) {
            notFound()
            return
        }

        if (acervoInstance.hasErrors()) {
            respond acervoInstance.errors, view:'edit'
            return
        }

        acervoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Acervo.label', default: 'Acervo'), acervoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*'{ respond acervoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Acervo acervoInstance) {

        if (acervoInstance == null) {
            notFound()
            return
        }

        acervoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Acervo.label', default: 'Acervo'), acervoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'acervo.label', default: 'Acervo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
