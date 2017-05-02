# Author::    Marcelo Vargas  (mailto:marcelo.vargas@jalasoft.com)
# Copyright:: Copyright (c) 2017 Cucumber Class
# License::   Distributes under the same terms as Ruby

# This feature covers the validation of elements to be sure that www.google.com is working as expected

Feature: Google Page
	This feature covers the validation of elements to be sure that www.google.com is working as expected
	
Scenario: Google Search button works as expected
	Given I am in google main page
	And I have filled the input 
	When I press the 'Google Search' button
	Then I should get results

Scenario: Google Search button is enabled
	Given I am in google main page
	When I check 'Google Search' button status
	Then I should get it as enabled

Scenario: Google Search input is editable
	Given I am in google main page
	When I fill some text in 'Google Input' field
	Then I should see the text in the field

Scenario: Google Search input is editable
	Given I am in google main page
	When I fill some text in 'Google Input' field
	Then I should see the text in the field

Scenario: Google Search voice is working
	Given I am in google main page
		And I press the 'Voice Search' 
	When I submit some voice message
	Then I should see the text in the field