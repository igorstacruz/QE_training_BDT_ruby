require 'date'
 
def write_file_load  users = 100
  
 destinations = {1 => "CBBA", 2 => "LPAZ", 3 => "STCRZ", 4 => "ORURO", 5 => "PANDO", 6 => "BENI", 7 => "TJA", 8 => "SCRE", 9 => "PTSI"}
 file_users = File.open("LoadTest.txt", 'w+')
 header = "|USER      |PASSWORD|TRAVEL_DATE|DESTINATION|\n"
 file_users.write(header)
 index = 1
 users.times do
   user_index = sprintf '%02d', index
   city = destinations[rand(1..9)]
   date = (Date.today-rand(365)).strftime("%m/%d/%Y")
   line = "|USER_#{user_index}|PASS_#{user_index}     |#{date}      |#{city}|\n"
   file_users.write(line)
   index = index + 1
 end	
 file_users.close
end

write_file_load