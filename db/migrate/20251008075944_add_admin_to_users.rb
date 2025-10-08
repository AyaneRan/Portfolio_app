class AddAdminToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :Admin, :boolean, default: false, null: false
  end
end
