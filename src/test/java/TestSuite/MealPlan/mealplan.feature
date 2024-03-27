Feature: Test Get Meal Plan

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '1065eecace0f45d9abfa481db565817b'
    * def hash = 'e43e22e2600cbd495d80d260a765068af209b256'
    * def username = 'frfusch21'
    * def startDate = '2024-02-25'

  Scenario: Test Generate Meal Plan
    Given path 'mealplanner/generate'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'Response:', response

  Scenario: Adding items to the meal planner
    Given path 'mealplanner',username, 'items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request [{"date": 1708827933,"slot": 1,"position": 0,"type": "INGREDIENTS","value": {"ingredients": [{"name": "1 banana"},{"name": "coffee","unit": "cup","amount": "1","image": "https://img.spoonacular.com/ingredients_100x100/brewed-coffee.jpg"}]}},{"date": 1589500800,"slot": 2,"position": 0,"type": "CUSTOM_FOOD","value": {"id": 348,"servings": 1,"title": "Aldi Spicy Cashews - 30g","image": "https://img.spoonacular.com/ingredients_100x100/cashews.jpg"}}]
    When method post
    Then status 200
    And match response.status == 'success'

  Scenario: Test Meal Plan Week
    Given path 'mealplanner', username, 'week', startDate
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print 'Response:', response