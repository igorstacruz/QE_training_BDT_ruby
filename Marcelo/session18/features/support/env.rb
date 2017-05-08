require 'pathname'
require 'json'
require 'json_spec/cucumber'

def get_value_from_json(json_parsed, field_name)    
	field_value = false
	json_parsed.each_pair do |key, value|
		if key.eql?(field_name)
			field_value = value
	    end
	    break if field_value != false      
    end        
    return field_value  
end