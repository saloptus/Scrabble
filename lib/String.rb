class String
	#create a new method that checks if the string is "numerical"
	#"43" => true ; "43.3" => true; "Hello" => false
	def is_numerical_string?
		#try to change the string into a float
		#if the operation needs rescuing, set the value of maybe_float to nil
		begin
			maybe_float=Float(self)
		rescue
			maybe_float=nil
		end
		# if the value of maybe_float is nil then it isn't a numerical string
		if maybe_float==nil
			return false
		# if the value of myabe_float is anything other than nil, it is a numerical string
		else
			return true
		end
	end
end
