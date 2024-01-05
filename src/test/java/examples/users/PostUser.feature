@getusers
Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url baseUrl

  Scenario: Post Scenarios
    Given path 'users'
    * def json = karate.read('classpath:examples/helpers/PostUserBody.json')
    * print json
    * def postBody = json.PostUsers
    * print postBody
    And request postBody
    When method post
    And status 201
    And print response
    Then match response ==
    """
    {
    "id": #number,
    "name": "#string",
    "username": "#string",
    "email": "#string",
    "address": {
      "street": "#string",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
     }
    """
