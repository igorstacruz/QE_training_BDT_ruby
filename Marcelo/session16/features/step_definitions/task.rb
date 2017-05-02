

Given(/^I have (\w+), (\d+) and \$(\d+) of the client$/) do |name, id, total_price|
	singleton_example.build_hashes name, id, total_price 
end

When(/^I select an client$/) do
	puts "Selecting client"
end

Then(/^I should receive \$(\d+)$/) do |total_price|
	puts "** TOTAL PRICE: #{total_price}"
end

Given(/^I have a list of clients$/) do
	puts "I have a list of clients"
end

When(/^I search a client by ID (\d+)$/) do |id|
	@id = id
	puts "Searching user by ID: #{id}"
end

Then(/^I should get if the client exists$/) do
	puts "The value #{@id} exists? #{$hash1.has_value?(@id)}"
end
