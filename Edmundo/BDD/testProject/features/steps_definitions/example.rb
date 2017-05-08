Given(/^a board like:$/) do |table|
  @board = table.raw
  # table is a Cucumber::MultilineArgument::DataTable
  # pending # Write code here that turns the phrase above into concrete actions
end

When(/^player (x|o) plays in row (\d+), column (\d+)$/) do |player, row, col|
  row, col = row.to_i, col.to_i
  @board[row][col] = player
  # pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the board should look like this:$/) do |expected_table|
  # table is a Cucumber::MultilineArgument::DataTable
  # pending # Write code here that turns the phrase above into concrete actions
  # @board.diff!(expected_table.raw)
  expected_table.diff!(@board)
end


Given(/^"([^"]*)" manual test$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the test is automated$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^manual test automated$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the report should look like:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end
