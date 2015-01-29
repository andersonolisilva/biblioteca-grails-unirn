package biblioteca.grails.unirn



import static org.springframework.http.HttpStatus.*
@Transactional(readOnly = true)
import grails.transaction.Transactional

class EmprestimoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Emprestimo.list(params), model:[emprestimoInstanceCount: Emprestimo.count()]
    }

    def show(Emprestimo emprestimoInstance) {
        respond emprestimoInstance
    }

    def create() {
        respond new Emprestimo(params)
    }

    @Transactional
    def save(Emprestimo emprestimoInstance) {
        if (emprestimoInstance == null) {
            notFound()
            return
        }

        if (emprestimoInstance.hasErrors()) {
            respond emprestimoInstance.errors, view:'create'
            return
        }

        emprestimoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), emprestimoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond emprestimoInstance, [status: CREATED] }
        }
    }

    def edit(Emprestimo emprestimoInstance) {
        respond emprestimoInstance
    }

    @Transactional
    def update(Emprestimo emprestimoInstance) {
        if (emprestimoInstance == null) {
            notFound()
            return
        }

        if (emprestimoInstance.hasErrors()) {
            respond emprestimoInstance.errors, view:'edit'
            return
        }

        emprestimoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Emprestimo.label', default: 'Emprestimo'), emprestimoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*'{ respond emprestimoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Emprestimo emprestimoInstance) {

        if (emprestimoInstance == null) {
            notFound()
            return
        }

        emprestimoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Emprestimo.label', default: 'Emprestimo'), emprestimoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
