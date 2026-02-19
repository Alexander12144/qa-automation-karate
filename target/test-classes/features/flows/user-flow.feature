Feature: Flujo completo usuario

Scenario: Crear usuario + Obtener usuario

# 1️⃣  Crear usuario
* def createUser = call read('classpath:features/users/create-user.feature')
* def userId = createUser.userId
* karate.log('ID del usuario creado:', userId)

# 2️⃣  Obtener usuario
* def getUser = call read('classpath:features/users/get-user.feature') { userId: '#(userId)' }
* karate.log('Usuario obtenido:', getUser.response)

# 3️⃣  Actualizar usuario
* def updateUser = call read('classpath:features/users/upgrade-user.feature') { userId: '#(userId)' }
* karate.log('Usuario actualizado:', updateUser.response)

# 4️⃣  Eliminar usuario
* def deleteUser = call read('classpath:features/users/delete-user.feature') { userId: '#(userId)' }
* karate.log('Usuario eliminado, status:', deleteUser.responseStatus)

# Consultar usuario eliminado para verificar eliminación
* def getDeletedUser = call read('classpath:features/users/get-user-not-found.feature') { userId: '#(userId)' }
* karate.log('Intento de obtener usuario eliminado, status:', getDeletedUser.responseStatus)    


* karate.log('Flujo completo ejecutado exitosamente')
