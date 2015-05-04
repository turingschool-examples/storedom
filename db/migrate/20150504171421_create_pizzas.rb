class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :crust_type
      t.integer :displayable_id
      t.string :displayable_type

      t.timestamps
    end
  end
end
