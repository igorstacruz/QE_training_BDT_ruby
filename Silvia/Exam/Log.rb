module Logger	
	def Logger.initialize
		log_file = File.open("execution.log", 'w+')
		log_file.truncate(0)
		log_file.close		
	end

	def Logger.log (line)
		log_file = File.open("execution.log", 'a')
		log_file.write(line)
		log_file.write("\n")
		log_file.close
	end
end