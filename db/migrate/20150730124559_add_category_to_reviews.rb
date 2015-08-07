class AddCategoryToReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :category, :string
  end
end
