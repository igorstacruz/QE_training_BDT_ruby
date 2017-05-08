=begin
Ruby variables
=end
# Module defined in distance_convertions.rb file

module Logger
	@file_example = File.open('execution.log','w+')
	@file_example.truncate(0)

	def Logger.data_inserted info, data
		@file_example.write("Data inserted - #{info} : #{data}")
		@file_example.write("\n")
	end
	def Logger.data_returned info, data
		@file_example.write("Data returned - #{info} : #{data}")
		@file_example.write("\n")
	end
end