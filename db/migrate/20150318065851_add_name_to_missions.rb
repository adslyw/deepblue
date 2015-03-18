class AddNameToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :name, :string
  end
end
