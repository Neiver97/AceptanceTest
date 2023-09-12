Feature: The Star Wars API

  Background: Get urlBase
    * url urlBase
    * def planetsLocation = read('../schema/planetsSchema.json')


  Scenario: Get all the species resources
    Given path 'species/'
    And param page = 3
    When method GET
    Then status 200
    * match response contains {"count": 37, "next": "https://swapi.dev/api/species/?page=4","previous": "https://swapi.dev/api/species/?page=2",}

    Scenario: Get all the vehicles resources
    Given path 'vehicles/'
    When method GET
    Then status 200
    * match each $.results[*].model == "#string"
    And match $ contains { "count": 39, "next": "https://swapi.dev/api/vehicles/?page=2", "previous": null}

  Scenario: Get a planets resources
    Given path 'planets/26'
    When method GET
    Then status 200
    * match response != "Error"
    * match response == planetsLocation

  Scenario: Get all the people resources
    Given path 'people/'
    When method GET
    Then status 200
    And match $.results[5] contains {"name": "#notnull", "height": "#notnull", "mass": "#notnull","hair_color": "#notnull","skin_color": "#notnull","eye_color": "#notnull",}