class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.references :user, index: true
      t.string :attachment

      t.timestamps null: false
    end
    add_foreign_key :assets, :users
  end
end
