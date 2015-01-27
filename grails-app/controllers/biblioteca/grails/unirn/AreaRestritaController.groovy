package biblioteca.grails.unirn

import grails.plugin.springsecurity.SpringSecurityService;

class AreaRestritaController {
		
	def index(){
		render(view:"/areaRestrita/logar")
	}
	
	def logar(){
		render(view:"/areaRestrita/logar")
	}
	
	def error(){
		render(view:"/areaRestrita/error")
	}
	
	def admin(){
		String usuario = SpringSecurityService.principal.username
		render(view:"/areaRestrita/admin", model: [usuario: usuario])
	}
	
	def logout(){
		render(view:"/areaRestrita/logout")
	}
}
