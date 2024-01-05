@getchar
Feature: getchar

  Background:
    * url baseurl

  Scenario: getchar
    Given path 'character'
    When method get
    * def firstSpecy = response.results[15].species
    And print firstSpecy
    Then status 200

    Given path 'character'
    And params {species: #(firstSpecy)}
    When method get
    And print response
    Then status 200


#    Given path 'character'
#    * def alper = {species:''}
#    * karate.set('alper', '$.species', charSpecies)
#    * print alper
#    And params alper
#    And method get