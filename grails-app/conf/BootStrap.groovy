import util.Permission;
import util.Login
import util.LoginPermission;
import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->
		
		Permission admin = Permission.findByAuthority("ROLE_ADMIN")
		if (admin==null){
			admin = new Permission(authority:"ROLE_ADMIN").save(flush:true)
		}
		
		Permission biblio = Permission.findByAuthority("ROLE_BIBLIOTECARIO")
		if (biblio==null){
			biblio = new Permission(authority:"ROLE_BIBLIOTECARIO").save(flush:true)
		}
		
		Login administrador = Login.findByUsername("administrador")
		if(administrador==null){
			administrador = new Login(username:"administrador", password:"123", enable:true, accountExpired:false, accountLocked:false, passwordExpired:false).save(flush:true)
		}
		
		Login bibliotecario = Login.findByUsername("bibliotecario")
		if(bibliotecario==null){
			bibliotecario = new Login(username:"bibliotecario", password:"123", enable:true, accountExpired:false, accountLocked:false, passwordExpired:false).save(flush:true)
		}
		
		if(LoginPermission.findByLoginAndPermission(administrador, admin) == null){
			new LoginPermission(login:administrador, permission:admin).save(flush:true)
		}
		
		if(LoginPermission.findByLoginAndPermission(bibliotecario, biblio) == null){
			new LoginPermission(login:bibliotecario, permission:biblio).save(flush:true)
		}
    }
    def destroy = {
    }
}
