Given(/^I drive ([1-9])\.([1-9]) kms to the work$/) do |kms, ms|
  puts "Driven #{kms}.#{ms}"
end

When(/^I enter to the parking area$/) do
   puts "Entered to the parking area"
end

Then(/^I am at work$/) do
  puts "At work!! so exciting!"
end

Given(/^I am in the cafeteria$/) do
  puts "Cafeteria station"
end

When(/^I pay \$([1-9]) for (\w+)$/) do |cost, product|
  puts "Paid #{cost} #$ for #{product}}"
end

Then(/^I have a breakfast$/) do
  puts "Breakfast time!"
end

Given(/^I have the following availability in my calendar:$/) do |table|
	# table is a Cucumber::MultilineArgument::DataTable
	@calendar = table.raw
	@row_headers = @calendar[0]
	@column0 = @calendar.map {|row| row[0]}

	# delete this cycle, just to see the content
	# @column0.each do |n|
	# 	puts "** #{n}"
	# end
	# puts "^^ #{@row_headers.index('Monday')}"
	# puts "^^ #{@column0.index('10:00')}"
end

When(/^I go to have (\w+) meeting on (\w+) at (\d+):(\d+)$/) do |type, day, hour, minute|
	row, col = hour.to_i, minute.to_i
	# puts ">>> DAY(#{day}): #{@row_headers.index(day)}"
	# puts @column0.index(hour+':'+minute)
	# puts ">>> HOUR:MINUTE (#{hour}:#{minute}): #{@column0.index(hour+':'+minute)}"
	@calendar[@column0.index(hour+':'+minute)][@row_headers.index(day)] = 'x'

end

Then(/^my calendar should look like this:$/) do |expected_table|
  # table is a Cucumber::MultilineArgument::DataTable
	# @calendar.each do |r|
	# 	puts r.each { |p| print "[#{p}]" }.join(" ")
	# end
  	expected_table.diff!(@calendar)
end

Given(/^I have the following availability to have lunch:$/) do |table|
	# table is a Cucumber::MultilineArgument::DataTable
	@lunch = table.raw
	@row_headers = @lunch[0]
	@column0 = @lunch.map {|row| row[0]}
end

When(/^I go to have lunch on (\w+) at (\d+):(\d+)$/) do |day, hour, minute|
	@lunch[@column0.index(hour+':'+minute)][@row_headers.index(day)] = 'x'
end

Then(/^my lunch time should look like this:$/) do |expected_table|
	# table is a Cucumber::MultilineArgument::DataTable
  	expected_table.diff!(@lunch)
end