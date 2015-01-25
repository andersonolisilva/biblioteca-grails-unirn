package biblioteca.grails.unirn

class Usuario {

	String nome
	String email
	String senha
	
	static hasMany = [emprestimos: Emprestimo]
	
    static constraints = {
		email email: true
    }
	
	static mapping = {
	}
}
