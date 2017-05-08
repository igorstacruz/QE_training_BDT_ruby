Given (/^I login to the app$/) do
  puts "Login"
end

Given (/^a have the next activities$/) do |table_tasks|
  @tasks = table_tasks.transpose.raw.first
end

When (/^I intialize the activities as:$/) do |table_tasks|
  @tasks_matrix = table_tasks.raw
  puts "tasks matrix:"
  puts @tasks_matrix
end

When (/^"(.*?)" change status to (TO DO|IN PROGRESS|DONE)$/) do |task, status|
  puts "tasks matrix:"
  puts @tasks_matrix
  tasks_status = {"TO DO"=>1,"IN PROGRESS"=>2,"DONE"=>3}
  status_index = tasks_status[status]
  task_index = @tasks.index(task) + 1
  puts @tasks_matrix
  @tasks_matrix[task_index][1] = ''
  @tasks_matrix[task_index][status_index] = 'X'
end

Then (/^the activites have the next status:$/) do |table|
table.diff!(@tasks_matrix)
end