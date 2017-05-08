Given(/^I have \$(\d+) in my account$/) do |balance|
	@balance = balance.to_i
end

When(/^I choose to withdraw the fixed amount of \$(\d+)$/) do |withdraw|
	@saldo  = @balance - withdraw.to_i;
end

Then(/^I should receive \$(\d+) cash$/) do |cash|
end

Then(/^the balance of my account should be \$(\d+)$/) do |remaining|
	expect(remaining.to_i).to eq(@saldo.to_i)
end

