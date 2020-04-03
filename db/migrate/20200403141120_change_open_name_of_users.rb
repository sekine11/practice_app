class ChangeOpenNameOfUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :open_name, :string, default: nil
    change_column :users, :private_name, :string, default: nil
  end
end
