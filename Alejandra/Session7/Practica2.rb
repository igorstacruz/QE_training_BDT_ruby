
def random_date
	random_year = Random.new.rand(2000..2014)
 	random_month =Random.new.rand(1..12)
    random_day  = Random.new.rand(1..30)
	date = Time.new(random_year,random_month,random_day)
	date.strftime("%m/%d/%Y")
end

def random_city
	cities = ["CBBA", "SCR", "POT", "ORURO", "STA-CRUZ", "LPAZ", "PANDO", "BENI", "TARIJA"]
	cities[Random.new.rand(0..8)]
end

def generate_users 
	file_name = "users_list.txt"
	users_list = File.open(file_name, "a+")
	users_list.truncate (0)
	nro = 100
	index = 1
	begin
		users_list.write ("\nuser_%.2i\s|\s" %index)
		users_list.write ("pass_%.2i\s|\s" %index)
		users_list.write ("#{random_date}\s|\s")
		users_list.write ("#{random_city}")
		index += 1
	end while index <= nro

	users_list.close
	users_list = File.open(file_name)
	print users_list.read
end

generate_users
