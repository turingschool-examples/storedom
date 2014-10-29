class CreateSmallTables < ActiveRecord::Migration
  def change
    create_table :small_tables do |t|
      t.string :some_data
      t.string :some_more_data

      t.timestamps
    end
  end
end
