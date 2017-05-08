def log (name)
	file_example = File.open(name, 'a')
	#file_example.truncate(0)
	puts "How many lines do you want to have?"
	number_of_lines = gets.chomp.to_i
	number_of_lines.times do 
		puts "Enter the #{} line"
		line = gets
		file_example.write(line)
	end
	file_example.close
	file_example = File.open(name)
	puts "The file content is: "
	print file_example.read
end

puts "Enter the name of the file"
file_name = gets.chomp
log(file_name)