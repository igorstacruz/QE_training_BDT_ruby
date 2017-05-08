Feature: Google basic search UI validation
Scenario: Google Search OK
Given I am on google main page
When I set the next content on search bar: "Test search"
And I type Enter
then I should see "Wikipedia:Search engine test - Wikipedia" on the search result list

Scenario: Google empty search validation
Given I am on google main page
When I set the next content on search bar: ""
And I type Enter
then I should see no search reasults 