class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name, limit: 100, null: false
    	t.string :description
   		t.string :references
   		t.string :product_owner
   		t.string :team

      t.timestamps null: false
    end
  end
end
