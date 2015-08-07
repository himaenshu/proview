module ApplicationHelper
	
	def display_string(str, count=30)
		str ? str.truncate(count) : ""
	end	

end
