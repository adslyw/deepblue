class ChangeColumnTypeInMission < ActiveRecord::Migration
  def change
    change_column(:missions, :sql, :text)
  end
end
