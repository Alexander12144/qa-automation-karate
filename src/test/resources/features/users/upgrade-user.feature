Feature: Actualizar usuario

    Background:
        * url baseUrl
        * header Authorization = 'Bearer ' + token
        * header Content-Type = 'application/json'
    Scenario: Actualizar usuario creado
    Given path 'users', userId
    And request
        """
        {
            "name": "Alexander QA Updated"
        }
        """
    When method PUT
    Then status 200
    And match response.name == 'Alexander QA Updated'