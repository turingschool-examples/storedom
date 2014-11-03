class CreatePhotographs < ActiveRecord::Migration
  def change
    create_table :photographs do |t|
      t.string :url
      t.references :photographable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
