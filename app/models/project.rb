class Project < ActiveRecord::Base
	
	STATUS = ["Active", "Inactive"]

	has_many :reviews
	has_many :arch_reviews, -> { where category: 'Architecture' }, class_name: 'Review'
	has_many :code_reviews, -> { where category: 'Code' }, class_name: 'Review'

	has_many :tasks, through: :reviews
	has_many :risks, through: :reviews
	has_many :recommendations, through: :reviews
	has_many :open_risks, through: :reviews
	has_many :open_recommendations, through: :reviews

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :technology_stack, presence: true
	validates :status, presence: true
	validates :product_owner, presence: true
	validates :team, presence: true

	def active?
		status == 'Active'
	end

	def arch_recommendations
		arch_reviews.map{|r| r.recommendations}.flatten
	end

	def open_arch_recommendations
		arch_reviews.map{|r| r.open_recommendations}.flatten
	end	

	def code_recommendations
		code_reviews.map{|r| r.recommendations}.flatten
	end

	def open_code_recommendations
		code_reviews.map{|r| r.open_recommendations}.flatten
	end	

end
