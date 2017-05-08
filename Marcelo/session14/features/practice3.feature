# Author::    Marcelo Vargas  (mailto:marcelo.vargas@jalasoft.com)
# Copyright:: Copyright (c) 2017 Cucumber Class
# License::   Distributed under the same terms as Ruby

Feature: Validation three scenarios
	Add validation steps for :
		ZipCode (only digits)
		Username (only lower case)
		Country  (any character except digits)
	
Scenario: validate zipcode field
	Given I have the ZipCode available
	When I fill 34523

Scenario: validate username field
	Given I have the Username field editable
	When I enter tester in the field

Scenario: validate country field
	Given I have the Country field editable
	When I select Bolivia