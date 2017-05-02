Given(/^I have (\d+)\$ in my (\w+)$/) do |amount, place|
  puts "** I have #{amount} in my #{place}"
end

When(/^I go to (\w+)$/) do |location|
  puts "** I go to #{location}"
end

When(/^I pay (\d+)\$ for an? (\w+) using (\w+)$/) do |cost, product, payment|
	@product = product
	puts "I paid #{cost} to buy #{@product}"
end

Then(/^I can go (\w+) to eat the (\w+)$/) do |place_to_eat, product|
	puts "I go #{place_to_eat} to eat my #{product}"
end
