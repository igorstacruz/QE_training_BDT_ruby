# Author: Igor Santa Cruz


Feature: Fruts sell


Scenario: update quantity after eat a fruit
    Given I had 10 apples and 50$ on Cash and 100$ on Credit Card
    When  I eat 1 apple
    And  I pay 10$ with Credit Card
    And  I eat 3 apples
    And  I pay 30$ with Cash
    Then I have 6 apples and 20$ on Cash and 90$ on Credit Card

