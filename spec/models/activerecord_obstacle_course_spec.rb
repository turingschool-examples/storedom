require "rails_helper"

describe "ActiveRecord Obstacle Course" do
  let(:item_1) { Item.create(name: "Thing 1") }
  let(:item_2) { Item.create(name: "Thing 2") }
  let(:item_3) { Item.create(name: "Thing 3") }
  let(:item_4) { Item.create(name: "Thing 4") }
  let(:item_5) { Item.create(name: "Thing 5") }
  let!(:order_1) { Order.create(amount: 200, items: [item_1, item_1, item_2, item_3]) }
  let!(:order_2) { Order.create(amount: 300, items: [item_1, item_1, item_2, item_3]) }
  let!(:order_3) { Order.create(amount: 500, items: [item_2, item_3, item_4, item_5]) }
  let!(:order_4) { Order.create(amount: 500, items: [item_1, item_1, item_2, item_3]) }

  it "finds orders by amount" do
    # ----------------------- Using Ruby -------------------------
    orders_of_500 = Order.all.select { |order| order.amount == 500 }
    orders_of_200 = Order.all.select { |order| order.amount == 200 }
    # ------------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    # Get the tests below to pass using ActiveRecord's `where` instead of
    # the Ruby implementation above.
    # ------------------------------------------------------------

    # Expectation
    expect(orders_of_500.count).to eq(2)
    expect(orders_of_200.count).to eq(1)
  end

  it 'finds multiple items by id' do
    ids = [item_1.id, item_2.id, item_4.id]
    # ----------------------- Using Ruby -------------------------
    items = Item.all.select { |item| ids.include?(item.id) }
    # ------------------------------------------------------------


    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(items).to eq([item_1, item_2, item_4])
  end

  it "sorts the orders from most expensive to least expensive" do
    # ----------------------- Using Ruby -------------------------
    orders = Order.all.sort_by { |order| order.amount }.reverse
    # ------------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(orders).to eq([order_4, order_3, order_2, order_1])
  end

  it "plucks all values from one column" do
    # ----------------------- Using Ruby -------------------------
    names = Item.all.map(&:name)
    # ------------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(names).to eq(["Thing 1", "Thing 2", "Thing 3", "Thing 4", "Thing 5"])
  end

  it "returns the average amount for all orders" do
    # ---------------------- Using Ruby -------------------------
    average = (Order.all.map(&:amount).inject(:+)) / (Order.count)
    # -----------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(average).to eq(375)
  end

  it "calculates the total sales" do
    # ---------------------- Using Ruby -------------------------
    total_sales = Order.all.map(&:amount).inject(:+)
    # -----------------------------------------------------------

    # ------------------ Using ActiveRecord ---------------------
    # Solution goes here
    # -----------------------------------------------------------

    # Expectation
    expect(total_sales).to eq(1500)
  end

  it "returns all orders for item_4" do
    # ------------------ Inefficient Solution -------------------
    order_ids = OrderItem.where(item_id: item_4.id).map(&:order_id)
    orders = Order.find(order_ids)
    # -----------------------------------------------------------

    # ------------------ Improved Solution ----------------------
    # Solution goes here
    # -----------------------------------------------------------

    # Expectation
    expect(orders).to eq([order_3])
  end

  it "returns items that are associated with one or more orders" do
    unordered_item = Item.create(name: "Unordered Item")
    # ----------------------- Using Ruby -------------------------
    items = Item.all

    ordered_items = items.map do |item|
      item if item.orders.present?
    end

    ordered_items = ordered_items.compact
    # ------------------------------------------------------------

    # ------------------ ActiveRecord Solution ----------------------
    # Solution goes here
    # ---------------------------------------------------------------

    # Expectations
    expect(ordered_items).to eq([item_1, item_2, item_3, item_4, item_5])
    expect(ordered_items).to_not include(unordered_item)
  end

  it "returns the names of items that are associated with one or more orders" do
    unordered_item = Item.create(name: "Unordered Item")
    # ----------------------- Using Ruby -------------------------
    items = Item.all

    ordered_items = items.map do |item|
      item if item.orders.present?
    end

    ordered_items_names = ordered_items.compact.map(&:name)
    # ------------------------------------------------------------

    # ------------------ ActiveRecord Solution ----------------------
    # Solution goes here
    # When you find a solution, experiment with adjusting your method chaining
    # Which ones are you able to switch around without relying on Ruby's Enumerable methods?
    # ---------------------------------------------------------------

    # Expectations
    expect(ordered_items_names).to eq(["Thing 1", "Thing 2", "Thing 3", "Thing 4", "Thing 5"])
  end

  xit "returns the names of items that have been ordered without n+1 queries" do
    # What is an n+1 query?
    # This video is older, but the concepts explained are still relevant:
    # http://railscasts.com/episodes/372-bullet

    # Don't worry about the lines containing Bullet. This is how we are detecting n+1 queries.
    Bullet.enable = true
    Bullet.raise = true
    Bullet.start_request

    # ------------------------------------------------------
    orders = Order.all # Edit only this line
    # ------------------------------------------------------

    # Do not edit below this line
    orders.each do |order|
      order.items.each do |item|
        item.name
      end
    end

    # Don't worry about the lines containing Bullet. This is how we are detecting n+1 queries.
    Bullet.perform_out_of_channel_notifications
    Bullet.end_request
  end
end
