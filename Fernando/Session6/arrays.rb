def getArray
	return [2, 3, 5]
end

def printFirst(customArray)
	if(customArray.kind_of?(Array))
	  return customArray.first
	else 
	  return "Is not a valid array"
	end 	
end

def printLast(customArray)
	if(customArray.kind_of?(Array))
	  return customArray.last
	else 
	  return "Is not a valid array"
	end 	
end


def printCommon(customArrayOne, customArrayTwo)
   if(customArrayOne.kind_of?(Array) and 
   	     customArrayTwo.kind_of?(Array))
      return customArrayOne & customArrayTwo
   else
   	  return "One of the arrays are incorrect"
   end
end


p printCommon([2,3,4],[2,2])
