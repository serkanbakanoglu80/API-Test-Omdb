@getusers
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url baseUrl

  Scenario: get all users and then get the first user by id
    Given path 'users'
    When method get
    Then status 200
    * print response
    * def firstUser = response[0]
    Then status 200
    And match firstUser.username == 'Bret'
    And match firstUser.company.name == 'Romaguera-Crona'
    And match firstUser.address.street == "Kulas Light"
    And match responseType == 'json'
    And assert responseTime < 500
    And assert responseStatus == 200 || responseStatus == 201
