class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :description
      t.string :sql
      t.string :params
      t.string :sql_type
      t.boolean :multiple

      t.timestamps null: false
    end
  end
end
