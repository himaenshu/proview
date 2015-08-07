class Review < ActiveRecord::Base

	CATEGORY = ["Architecture", "Code"]

	belongs_to :project
	has_many :tasks
	has_many :risks
	has_many :recommendations

	has_many :open_tasks, -> { where status: 'Open' }, class_name: 'Task'
	has_many :open_risks, -> { where status: 'Open' }, class_name: 'Risk'
	has_many :open_recommendations, -> { where status: 'Open' }, class_name: 'Recommendation'

	validates :project_id, presence: true
	validates :category, presence: true
	validates :reviewed_on, presence: true, uniqueness: {message: "date should be unique for each review"}

	def code_review?
		category == 'Code'
	end
		
end
