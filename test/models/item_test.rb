require_relative '../test_helper'

class ItemTest < ActiveSupport::TestCase
  test "our factories" do
    item = FactoryGirl.create(:item)
    assert_equal String, item.description.class
    assert_equal String, item.name.class
    assert_equal String, item.image_url.class
  end

  test "orders create associations" do
    order = FactoryGirl.create(:order)
    assert_equal Order, order.class
    assert_equal User, order.user.class
  end

  test "create is slow" do
    assert_raises(Timeout::Error) do
      Timeout.timeout(0.25) do
        1000.times do
          FactoryGirl.create(:item)
        end
      end
    end
  end

  test "build stubbed is fast" do
    assert_nothing_raised do
      Timeout.timeout(0.25) do
        1000.times do
          FactoryGirl.build_stubbed(:item)
        end
      end
    end
  end

  test "build stubbed records are not in the DB" do
    Item.destroy_all
    item = FactoryGirl.build_stubbed(:item)
    assert_raises(ActiveRecord::RecordNotFound) { Item.find(item.id) }
    assert_nil Item.first
    assert_equal 0, Item.count
  end

  test "build stubbed still creates associations" do
    order = FactoryGirl.build_stubbed(:order)
    assert_equal Order, order.class
    assert_equal User, order.user.class
  end
end
