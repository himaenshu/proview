class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :project_id, null: false
    	t.date :reviewed_on, null: false
    	t.string :summary
    	 
      t.timestamps null: false

      t.index :project_id
    end
  end
end
