class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, limit: 100
      t.string :description
      t.timestamp :started_at
      t.timestamp :finishead_at

      t.timestamps
    end
  end
end
