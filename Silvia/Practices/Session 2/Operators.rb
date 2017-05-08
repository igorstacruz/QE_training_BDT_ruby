#Operadores aritmeticos y de Comparacion
edad_monica = 2**2
dentro_rango_edad = (1...10) === edad_monica
puts "Rango de edad (1...10)"
puts "Edad de Monica #{edad_monica}"
puts "Monica esta dentro el rango de edad? " + dentro_rango_edad.to_s

#Operadores de Asignaciom
edad_claudia = edad_monica
edad_claudia **= 2
puts "Rango de edad (1...15)"
puts "Edad de claudia #{edad_claudia}"
puts "Claudia esta dentro el rango de edad? #{(1...15) === edad_claudia}" 


#Operadores de comparacion
edad_alicia = edad_claudia
edad_lorena = 16
puts "Claudia tiene la misma edad que Alicia? #{edad_claudia.equal?edad_alicia}" #return true
puts "Claudia tiene la misma edad que Lorena? #{edad_claudia.equal?edad_lorena}" #return true

puts local_variables	#will print the list of all variables