class AddUserNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, uniqueness: :true
  end
end
