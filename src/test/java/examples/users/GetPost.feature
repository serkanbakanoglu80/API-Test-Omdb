@get
Feature: Get

  Background:
    * url baseUrl

  Scenario: First Get Scenario
    Given path 'posts'
    When method get
    * print response
    * def firstTitle = response[0].title
    * def id = get response[?(@.id== '1')]
    * print id
    * print firstTitle
    Then status 200
    And match firstTitle == 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'
    And match response[0] contains {'title': 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'}

