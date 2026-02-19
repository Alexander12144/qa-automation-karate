Feature: Login

    Scenario: Obtener Token
        Given url baseUrl
        And path 'login'
        And request
            """
            {
                "email": "eve.holt@reqres.in",
                "password": "cityslicka"
            }
            """
        When method POST
        Then status 200
        And match response.token == '#string'

        * def token = response.token