class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
        
      t.string :name, null: false
      t.string :description, null: false
      t.boolean :positive, null: true
      t.integer :user_id
      
      add_foreign_key :categories, :users

      t.timestamps null: false
    end
  end
end
