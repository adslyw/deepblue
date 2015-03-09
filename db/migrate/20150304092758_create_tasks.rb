class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :mission_id
      t.integer :status
      t.text :params

      t.timestamps null: false
    end
  end
end
