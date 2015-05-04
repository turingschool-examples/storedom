class CreateToppingRequests < ActiveRecord::Migration
  def change
    create_table :topping_requests do |t|
      t.integer :topping_id
      t.integer :toppable_id
      t.string :toppable_type

      t.timestamps
    end
  end
end
