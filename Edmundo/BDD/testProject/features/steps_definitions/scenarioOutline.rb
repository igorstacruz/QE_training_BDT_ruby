Given(/^I have \$(\d+) in my account$/) do |value|
  # pending # Write code here that turns the phrase above into concrete actions
  @balance = value.to_i
end

When(/^I choose to withdraw the fixed amount of \$(\d+)$/) do |value|
  # pending # Write code here that turns the phrase above into concrete actions
  @money = value.to_i
end

Then(/^I should receive \$(\d+) cash$/) do |value|
  # pending # Write code here that turns the phrase above into concrete actions\
  puts "This is your $#{value}"
end

Then(/^the balance of my account should be \$(\d+)$/) do |total|
  # pending # Write code here that turns the phrase above into concrete actions
  expect(@balance - @money).to eq(total.to_i)
end
