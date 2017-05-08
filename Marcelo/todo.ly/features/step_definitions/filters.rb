Given(/^I have set a connection to application$/) do
	@http_connection = Rest_service.get_connection
end

When (/I have filters by default in my account/) do
	puts "I have filters by default in my account"
end

When(/^I send a (GET) request to (\/filters\.json)$/) do |method, end_point|
	http_request = Rest_service.get_request(method, end_point)
	@http_response = Rest_service.execute_request(@http_connection, http_request)
	@last_json = @http_response.body
	@json_array_response = JSON.parse(@last_json)
end

Then(/^I expect HTTP code (\d+)$/) do |http_code|
	# TODO: Delete these puts
	puts "RESPONSE STATUS CODE: #{@http_response.code}"
	puts "RESPONSE BODY: #{@http_response.body}"

	expect(@http_response.code).to eql(http_code)
end

Then(/^I expect the default filter names in the response$/) do |table|
	# Save the table as an array
	@default_values = table.raw
	p @default_values

	# Iterate the array and compare the Name with the response values
	@default_values.each_with_index do |value, index|
		field_value = get_value_from_json(@json_array_response[index], "Content")
		puts "*** From table: #{index}, #{value} - From response: #{field_value}" 

		# I had to use gsub because the value from the table was like this ["Inbox"] VS "Inbox" and was failing the comparison, if we can improve this it will be great
		expect(value.to_s.gsub(/[\[\]\\""]/, '')).to eql(field_value)
	end
end

When(/^I have "([^"]*)" filter by default in my account$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I send a GET request to \/filters\/id\.json$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I expect the item "([^"]*)" data as response$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I send a GET request to \/filters\/id\/items\.json$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I expect the items for "([^"]*)" as response$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I send a GET request to \/filters\/id\/doneitems\.json$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I expect the items marked as "([^"]*)" for "([^"]*)" as response$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end
