class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.datetime :started_at, null: false
      t.datetime :ended_at, null: false
      t.text :content, null: false
      t.integer :user_id
      
      #add_foreign_key :entries :users

      t.timestamps null: false
    end
  end
end
