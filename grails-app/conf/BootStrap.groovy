import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
		def devel = GrailsUtil.developmentEnv
		if(devel){
			//new Autor(nome: "Teste Autor").save(failOnError:true)
		}
    }
    def destroy = {
    }
}
