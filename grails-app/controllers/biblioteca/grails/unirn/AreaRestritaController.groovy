package biblioteca.grails.unirn

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
		render(view:"/areaRestrita/admin")
	}
	
	def logout(){
		render(view:"/areaRestrita/logout")
	}
}
