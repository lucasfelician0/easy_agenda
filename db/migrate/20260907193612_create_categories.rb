class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :identifier, null: false
      t.string :name, limit: 100
      

      t.timestamps
    end
    
    add_index :categories, :identifier, unique: true
  end
end
