class Task < ActiveRecord::Base

  STATUS = ["Open", "Closed"]

	belongs_to :review
	
	validates :review_id, presence: true
	validates :type, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :implementation, presence: true, :if => lambda { |t| t.closed? }
						

	before_create :set_open

	
	def set_close
		self.status = 'Closed'
		self.status_updated_on = Date.today
	end	

	def set_open
		self.status = 'Open'
		self.status_updated_on = Date.today
	end

	def closed?
		status == 'Closed'
	end

	def action_taken
		(type=='Risk' ? 'Mitigation' : 'Implementation')
	end	

end
