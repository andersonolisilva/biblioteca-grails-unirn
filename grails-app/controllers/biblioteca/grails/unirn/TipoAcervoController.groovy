package biblioteca.grails.unirn



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoAcervoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoAcervo.list(params), model:[tipoAcervoInstanceCount: TipoAcervo.count()]
    }

    def show(TipoAcervo tipoAcervoInstance) {
        respond tipoAcervoInstance
    }

    def create() {
        respond new TipoAcervo(params)
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
                redirect action: "index", method: "GET"
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
