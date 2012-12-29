package bahman

import org.apache.commons.lang.builder.HashCodeBuilder

import static bahman.UserRole.*

class UserRole implements Serializable {

	User user
	Role role
    static hasMany = [subRoles:SubRole]

	boolean equals(other) {
		if (!(other instanceof UserRole)) {
			return false
		}

		other.user?.id == user?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static UserRole get(long userId, long roleId) {
		find 'from UserRole where user.id=:userId and role.id=:roleId',
			[userId: userId, roleId: roleId]
	}


	static UserRole create(User user, Role role,boolean flush = false) {
		new UserRole(user: user, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(User user, Role role, boolean flush = false) {
		UserRole instance = findByUserAndRole(user, role)
		if (!instance) {
			return false
		}
		instance.delete(flush: flush)
		true
	}

      static boolean findByUserAndSubRoles (User user,SubRole subRole){
          def userRole = UserRole.findByUser(user)
          for (sb in userRole.subRoles)
          {
              if (sb.id==subRole.id)
                  return true
          }
          false
      }

//    static boolean addSubRole(User user, Role role,SubRole subRole){
//        UserRole instance = findByUserAndRole(user, role)
//        if (!instance) {
//            return false
//        }
//        instance.addToSubRoles(subRole)
//        if (!instance.save()){
//            return false
//        }
//        true
//    }

	static void removeAll(User user) {
		executeUpdate 'DELETE FROM UserRole WHERE user=:user', [user: user]
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM UserRole WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'user']
		version false
	}
}
