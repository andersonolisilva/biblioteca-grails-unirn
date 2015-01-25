package biblioteca.grails.unirn

class Acervo {

	String titulo
	String autor
	TipoAcervo tipoAcervo
	
	static hasMany = [emprestimos: Emprestimo]
	
    static constraints = {
		titulo blanck:false, nullable:false
    }
	static mapping = {
	}
}
