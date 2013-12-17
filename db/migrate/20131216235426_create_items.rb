class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text   :description
      t.string :image_url

      t.timestamps
    end
  end
end
