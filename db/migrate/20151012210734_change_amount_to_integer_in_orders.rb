class ChangeAmountToIntegerInOrders < ActiveRecord::Migration
  def self.up
    change_column :orders, :amount, :integer
  end

  def self.down
    change_column :orders, :amount, :decimal
  end
end
