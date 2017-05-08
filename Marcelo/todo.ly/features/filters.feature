@api_test
Feature: Test todo.ly API filters

Scenario: Get all filters for current user
	Given I have set a connection to application
	When I have filters by default in my account
	When I send a GET request to /filters.json
	Then I expect HTTP code 200

Scenario: Filters by default are present for current user
	Given I have set a connection to application
	When I have filters by default in my account
	When I send a GET request to /filters.json
	Then I expect HTTP code 200
		And I expect the default filter names in the response
		| Inbox |
		| Today |
		| Next  |
		| Recycle Bin|

Scenario: Get filter by id for Inbox filter using current user
	Given I have set a connection to application
	When I have "Inbox" filter by default in my account
	When I send a GET request to /filters/id.json
	Then I expect HTTP code 200
		And I expect the item "Inbox" data as response

Scenario: Get filter items by id for Inbox filter using current user
	Given I have set a connection to application
	When I have "Inbox" filter by default in my account
	When I send a GET request to /filters/id/items.json
	Then I expect HTTP code 200
		And I expect the items for "Inbox" as response

Scenario: Get filter done items by id for Inbox filter using current user
	Given I have set a connection to application
	When I have "Inbox" filter by default in my account
	When I send a GET request to /filters/id/doneitems.json
	Then I expect HTTP code 200
		And I expect the items marked as "Done" for "Inbox" as response