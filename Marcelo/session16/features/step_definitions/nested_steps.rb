Given /^I have authenticated with the correct PIN$/ do
	steps %{
	And I have pushed my card in the slot
	And I enter my PIN
	And I press "OK"
	}
end

Given(/^I have pushed my card in the slot$/) do
	puts "** STEP: I have pushed my card in the slot"
end

When(/^I enter my PIN$/) do
	puts "** STEP: I enter my PIN"
end

When(/^I press "([^"]*)"$/) do |arg1|
	puts "** STEP: I presses OK"
end

Then(/^I should see the main menu$/) do
	puts "** STEP: I should see the main menu"
end	

Given /^an activated customer (\w+) exists$/ do |name|
	steps %{
	And I create a customer with login #{name}
	And I register the customer with login #{name}
	And I activate the customer with login #{name}
	}
end

Given (/^I create a customer with login (\w+)$/) do |name|
	puts "** CREATE: #{name}"
end	

When (/^I register the customer with login (\w+)$/) do |name|
	puts "** REGISTER: #{name}"
end	

Then (/^I activate the customer with login (\w+)$/) do |name|
	puts "** ACTIVATE: #{name}"
end	