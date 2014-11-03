class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :name
      t.belongs_to :customer, index: true

      t.timestamps
    end
  end
end
