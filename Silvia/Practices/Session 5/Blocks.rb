value_1 = 10  
5.times do | value_2; value_1 |
value_1 = value_2 
puts " value_1 inside the block: #{value_1 }"  
end  
  
puts " value_1 outside the block: #{value_1 }" 

$result
def method_block
##some code
$result=0
yield
puts "The value obtained is #{$result}"
end
method_block {$result = 15 *25}


method_block do
$result = $result==0? 25+15:25*5
puts "I changed the value into the block"
## any other code  that you would like to introduce into the method
end
method_block {$result = 15/25}