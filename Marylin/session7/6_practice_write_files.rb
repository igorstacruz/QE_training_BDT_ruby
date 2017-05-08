def write_file
	puts "Type a file name with its extention: "
	file_name = gets.chomp.to_s
	file_example = File.open(file_name,'w+')
	file_example.truncate(0)

	puts "Type the number of lines to type: "
	lines_number = gets.chomp.to_i

	$i = 0
	while $i < lines_number do
		puts "Type line #{$i}: "
		line = gets
		file_example.write(line)
		$i += 1
	end
	file_example.close

	file_example = File.open(file_name)
	print file_example.read
	file_example.close
end

write_file