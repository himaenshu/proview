module ProjectsHelper

	def link_to_tasks(open_count, total_count, url)
		link_label = "<span style='color:red;'>#{open_count}</span>&nbsp;(#{total_count})"
		link_to link_label.html_safe, url
	end

	def status_label(task)
		task_status = task.status
		if task.status == 'Closed'
			label = "<span style='color:green;'>#{task_status}</span>"
		else
			label = "<span style='color:red;'>#{task_status}</span>"
		end
		label.html_safe	
	end
		
end
