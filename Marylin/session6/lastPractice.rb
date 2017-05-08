def getUserName()
	puts "Type your userName: "
	user_name = gets.chomp.to_s

	while ((user_name =~ /([a-z0-9])/) == nil)
		puts "Type your userName: "
		user_name = gets.chomp.to_s
	end
end
