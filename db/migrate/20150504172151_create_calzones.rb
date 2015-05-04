class CreateCalzones < ActiveRecord::Migration
  def change
    create_table :calzones do |t|
      t.string :dough_type

      t.timestamps
    end
  end
end
