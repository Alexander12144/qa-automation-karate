Feature: Eliminar usuario

    Background:
        * url baseUrl
        * header Authorization = 'Bearer ' + token
        * header Content-Type = 'application/json'
    Scenario: Eliminar usuario creado
    Given path 'users', userId
    When method DELETE
    Then status 204