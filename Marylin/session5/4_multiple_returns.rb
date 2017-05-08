def multiple_return_sintaxis(arg1)
   calculation_1 = arg1 * 100
   calculation_2=  arg1 / 100
   return calculation_1 , calculation_2
end
value_added, value_divided = multiple_return_sintaxis(25)
puts "Value Added = #{value_added}, Value divided= #{value_divided}"
