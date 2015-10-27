require "rails_helper"

describe "ActiveRecord American Gladiator" do
  context "Joust" do
    # http://i.ytimg.com/vi/ln6PAh2faK4/maxresdefault.jpg

    it "loads all items" do
      Item.create(name: "Pugil Sticks", status: "active")
      Item.create(name: "Trap Door", status: "active")
      Item.create(name: "Crash Pad", status: "inactive")

      # Update items below without writing a new method
      items = Item.all

      expect(items.count).to eq 3
    end
  end
end
