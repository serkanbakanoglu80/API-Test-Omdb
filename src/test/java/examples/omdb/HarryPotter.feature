@harrypotter
Feature: omdb

  Background:
    * url baseUrl

  Scenario: By Search Harry Potter and get id of Harry Potter and the Sorcerer's Stone and search the id in By ID
    Given params {s: 'Harry Potter'}
    When method get
    And def imdbid = $response.Search[?(@.Title=="Harry Potter and the Sorcerer's Stone")].imdbID
    And params {i: #(imdbid)}
    When method get
    Then status 200
    And match response.Title == "Harry Potter and the Sorcerer's Stone"
    And match response.Year == "2001"
    And match response.Released == "16 Nov 2001"



