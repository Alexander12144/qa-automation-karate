Feature: Crear usuario

    Background:
        * url baseUrl
        * header Authorization = 'Bearer ' + token
        * header Content-Type = 'application/json'

    Scenario: Crear usuario nuevo
        * def randomEmail = 'alexander.' + java.util.UUID.randomUUID() + '@example.com'
        Given path 'users'
        And request
            """
            {
                "name": "Alexander QA",
                "gender": "male",
                "email": "#(randomEmail)",
                "status": "active"
            }
            """
        When method post
        Then status 201
        And match response.name == 'Alexander QA'
        And match response.email == randomEmail
        * def userId = response.id
