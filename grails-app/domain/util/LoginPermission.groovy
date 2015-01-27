package util

import org.apache.commons.lang.builder.HashCodeBuilder

class LoginPermission implements Serializable {

	private static final long serialVersionUID = 1

	Login login
	Permission permission

	boolean equals(other) {
		if (!(other instanceof LoginPermission)) {
			return false
		}

		other.login?.id == login?.id &&
		other.permission?.id == permission?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (login) builder.append(login.id)
		if (permission) builder.append(permission.id)
		builder.toHashCode()
	}

	static LoginPermission get(long loginId, long permissionId) {
		LoginPermission.where {
			login == Login.load(loginId) &&
			permission == Permission.load(permissionId)
		}.get()
	}

	static boolean exists(long loginId, long permissionId) {
		LoginPermission.where {
			login == Login.load(loginId) &&
			permission == Permission.load(permissionId)
		}.count() > 0
	}

	static LoginPermission create(Login login, Permission permission, boolean flush = false) {
		def instance = new LoginPermission(login: login, permission: permission)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Login u, Permission r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = LoginPermission.where {
			login == Login.load(u.id) &&
			permission == Permission.load(r.id)
		}.deleteAll()

		if (flush) { LoginPermission.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(Login u, boolean flush = false) {
		if (u == null) return

		LoginPermission.where {
			login == Login.load(u.id)
		}.deleteAll()

		if (flush) { LoginPermission.withSession { it.flush() } }
	}

	static void removeAll(Permission r, boolean flush = false) {
		if (r == null) return

		LoginPermission.where {
			permission == Permission.load(r.id)
		}.deleteAll()

		if (flush) { LoginPermission.withSession { it.flush() } }
	}

	static constraints = {
		permission validator: { Permission r, LoginPermission ur ->
			if (ur.login == null) return
			boolean existing = false
			LoginPermission.withNewSession {
				existing = LoginPermission.exists(ur.login.id, r.id)
			}
			if (existing) {
				return 'loginRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['permission', 'login']
		version false
		permission lazy:false
	}
}
