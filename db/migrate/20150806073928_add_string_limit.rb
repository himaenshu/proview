class AddStringLimit < ActiveRecord::Migration
  def change
		change_column(:projects, :description, :text)
		change_column(:projects, :references, :text)

		change_column(:reviews, :summary, :text)

		change_column(:tasks, :description, :text)
		change_column(:tasks, :implementation, :text)

  end
end
