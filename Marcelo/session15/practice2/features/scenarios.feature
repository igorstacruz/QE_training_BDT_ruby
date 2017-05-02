Feature: Scenarios with step definitions

Scenario: Buy apples
	Given I have 2$ in my pocket
		And I have 5$ in my savings
	When I go to supermarket
		And I pay 1$ for an apple using creditcard
	Then I can go home to eat the apple



