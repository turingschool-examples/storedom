class AddStoreIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :store, index: true
  end
end
