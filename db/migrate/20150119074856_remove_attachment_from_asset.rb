class RemoveAttachmentFromAsset < ActiveRecord::Migration
  def change
    remove_column :assets, :attachment, :string
  end
end
