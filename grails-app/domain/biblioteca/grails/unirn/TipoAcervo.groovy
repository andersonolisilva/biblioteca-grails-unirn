package biblioteca.grails.unirn

class TipoAcervo {

	String descricao
	
    static constraints = {
		descricao blank: false, nullable:false
    }
	static mapping = {
	}
}
