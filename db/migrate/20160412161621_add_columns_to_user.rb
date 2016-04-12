class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :password_confirmation, :string
    add_column :users, :username, :text
  end
end
