user_name = ""
while !(/[a-z0-9_-]/.match(user_name)) do
puts "Enter the user name"
user_name = gets.chomp
end