class RemoveConfirm < ActiveRecord::Migration
  def change
  	remove_column :users, :confirm_password
  end
end
