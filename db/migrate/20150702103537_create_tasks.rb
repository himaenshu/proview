class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.integer :review_id, null: false
    	t.string :type, null: false
    	t.string :title
      t.string :description
      t.string :implementation
    	t.string :owner
      t.string :status, null: false
      t.date :status_updated_on, null: false
      
      t.timestamps null: false

      t.index :review_id
      t.index :type
      t.index :status
    end
  end
end
