class AddStoreToItems < ActiveRecord::Migration
  def change
    add_reference :items, :store, index: true
  end
end
