@post
Feature: Post

  Background:
    * url baseUrl
    * def get = call read('classpath:examples/users/GetPost.feature')
    * print get
    * def title = get.firstTitle
    * print title

  Scenario: Get Scenarios
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


  Scenario: First Post Scenarios
    Given path 'posts'
    * def json = karate.read('classpath:examples/helpers/PostBody.json')
    * print json
    * def postBody = json.PostTitle3
    * print postBody
    * postBody.title = title
    And request postBody
    When method post
    Then status 201
    And print response