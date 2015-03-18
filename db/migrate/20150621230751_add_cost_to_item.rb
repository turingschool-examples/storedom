class AddCostToItem < ActiveRecord::Migration
  def change
    add_column :items, :cost, :integer
  end
end
