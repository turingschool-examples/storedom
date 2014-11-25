require_relative '../test_helper'
require "nokogiri"

class ItemsControllerTest < ActionController::TestCase
  def setup
    Item.destroy_all
    5.times do
      Item.create!(:name => Faker::Commerce.product_name,
                   :description => Faker::Lorem.paragraph,
                   :image_url => Faker::Avatar.image)
    end
  end

  def test_index_serves_html
    get :index
    assert_response 200
  end

  def test_show_gets_html
    item = Item.first
    get :show, :id => item.id
    assert_response 200
  end

end
