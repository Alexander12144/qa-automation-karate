Feature: Crear varios usuarios

    Background:
        * url baseUrl
        * header Authorization = 'Bearer ' + token
        * header Content-Type = 'application/json'
    Scenario Outline: Crear varios usuarios nuevos
        * def randomEmail =
            """
            function(name){
            return name.toLowerCase().replace(' ', '.')
            + '.' + java.util.UUID.randomUUID()
            + '@example.com';
            }
            """

        * def generatedEmail = randomEmail('<name>')
        Given path 'users'
        And request
            """
            {
                "name": "<name>",
                "email": "#(generatedEmail)",
                "gender": "<gender>",
                "status": "active"
            }
            """
        When method POST
        Then status 201
        And match response.name == '<name>'

        * karate.log('Usuario creado con ID:', response.id)

        Examples:
            | name         | gender |
            | Alexander QA | male   |
            | Maria QA     | female |

