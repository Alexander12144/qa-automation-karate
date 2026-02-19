Feature: Consultar usuario eliminado

    Background:
        * url baseUrl
        * header Authorization = 'Bearer ' + token
        * header Content-Type = 'application/json'
    Scenario: Validar que el usuario eliminado no existe
        Given path 'users', userId
        When method GET
        Then status 404