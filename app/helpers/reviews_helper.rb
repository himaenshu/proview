module ReviewsHelper
	
	def toggle_status_label(status)
		(status == "Open" ? "Mark Closed" : "Re-Open")
	end

	def toggle_status_value(status)
		(status == "Open" ? "Close" : "Open")
	end

	def exclude_attr?(attribute)
		params[:exclude] && params[:exclude].include?(attribute)
	end	
end
