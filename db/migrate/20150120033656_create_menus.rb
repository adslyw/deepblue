class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.string :icon
      t.string :url
      t.integer :parent_id

      t.timestamps null: false
    end
    add_index :menus, :parent_id
  end
end
