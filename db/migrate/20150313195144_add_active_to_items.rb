class AddActiveToItems < ActiveRecord::Migration
  def change
    add_column :items, :active, :boolean
  end
end
