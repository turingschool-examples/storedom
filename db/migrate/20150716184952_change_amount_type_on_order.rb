class ChangeAmountTypeOnOrder < ActiveRecord::Migration
  def change
    change_column :orders, :amount, :integer
  end
end
