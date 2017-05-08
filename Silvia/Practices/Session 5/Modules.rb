module Greetings
def print_hi
	puts "Hi"
end

def print_hello
	puts "Hello"
end
end

module Despedidas
def print_bye
	puts "Bye"
end

def print_adio
	puts "Adio"
end
end

class Saludo
include Greetings
include Despedidas
end

saludo = Saludo.new
saludo.print_hi
saludo.print_bye
