class AddAuthenticateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token_id, :string
    add_column :users, :device_id, :integer
  end
end
