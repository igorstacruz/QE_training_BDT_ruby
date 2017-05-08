def read_file
 puts "Insert file and extension on this format 'name.extension'"
 file_name = gets.chomp
 file_example = File.open(file_name, 'w+')
 #file_example.truncate(0)
 puts "how many lines would you like to insert:"
 lines = gets.chomp.to_i
 lines.times do
   puts "insert a line"
   line = gets
   file_example.write(line)
 end	
 file_example.close
 file_example = File.open(file_name)
 print file_example.read
end

read_file