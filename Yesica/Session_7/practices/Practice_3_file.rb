=begin
Ruby File: Practice 3 - Slide 9
Author: Yesica Acha	
=end

def create_file

	# Ask for the name of the file an extension
	puts "Please enter the name and the extension of the file"
	file_name = gets.chomp

	# Open file
	file =  File.open(file_name, 'w+')

	# Delete all the content of the file in case that already exists 
	file.truncate(0)

	# Ask the user the amount of lines to be added
	puts "How many lines would you like to add?"
	number_of_lines = gets.chomp

	# According to the amount of lines, ask for each line
	number_of_lines.to_i.times do |lines|
		print "#{lines + 1}: "
		file.write(gets)
	end

	# Close the file
	file.close

	return file_name
 
 end

# Print the values of the file
 def print_file_content file_name

 	puts "\n==========================================="
 	puts "Printing the content of the file"
 	puts "===========================================\n"

	# Open file
	file =  File.open(file_name)

	# Print file's content
	puts file.read

	puts "_____________________________________________\n"

	# Close the file
	file.close
end

# Add lines to file
def add_lines_to_file file_name

	# Change the mode of the file in order to add a new line to the existing file
	file =  File.open(file_name, 'a')

	# Ask the user the amount of lines to be added
	puts "How many lines would you like to add now?"
	number_of_lines = gets.chomp

	# According to the amount of lines, ask for each line
	number_of_lines.to_i.times do |lines|
		print "#{lines + 1}: "
		file.write(gets)
	end

	# Close the file
	file.close
end


# Create file, delete the content and add lines
file_name = create_file

# Print the content of the file
print_file_content file_name

# Add line to file
add_lines_to_file file_name

# Print the content of the file
print_file_content file_name
