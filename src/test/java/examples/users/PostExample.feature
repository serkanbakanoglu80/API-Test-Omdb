@postExample
Feature: Post

  Background:
    * url baseUrl

  Scenario Outline: Post Scenarios with examples
    Given path 'posts'
    * def postBody =
      """
      {
      "userId": 1,
      "id": 1,
      "title": "<title>",
      "body": "<body>"
      }
      """
    And request postBody
    When method post
    Then status 201
    And print response

    Examples:
      | title  | body  |
      | title  | body  |
      | title1 | body1 |
      | title2 | body2 |


  Scenario Outline: Post Scenarios with examples
    Given path 'posts'
    * def json = karate.read('classpath:examples/helpers/PostBody.json')
    * def postBody = json.<RequestBody>
    And request postBody
    When method post
    Then status 201

    Examples:
      | RequestBody  |
      | Posttitle  |
      | Posttitle  |
      | Posttitle1 |
      | Posttitle2 |