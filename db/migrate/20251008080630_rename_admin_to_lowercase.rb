class RenameAdminToLowercase < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :Admin, :admin
  end
end
