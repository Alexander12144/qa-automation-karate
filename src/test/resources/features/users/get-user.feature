Feature: Consultar

    Background:
        * url baseUrl
        * header Authorization = 'Bearer ' + token
        * header Content-Type = 'application/json'
    Scenario: Obtener usuario creado
        Given path 'users', userId
        When method GET
        Then status 200
        And match response.id == userId
