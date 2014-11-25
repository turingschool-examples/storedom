require_relative '../../../test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  def setup
    Item.destroy_all
    5.times do
      Item.create!(:name => Faker::Commerce.product_name,
                   :description => Faker::Lorem.paragraph,
                   :image_url => Faker::Avatar.image)
    end
  end

  def test_index_serves_json
    get :index, :format => :json
    assert_response 200
    raw_response = @response.body
    parsed_response = JSON.parse(raw_response)
    assert_equal 5, parsed_response.count
  end

  def test_index_serves_xml
    get :index, :format => :xml
    assert_response 200
    raw_response = @response.body
    parsed_response = Nokogiri::XML(raw_response)
    assert_equal 5, parsed_response.xpath('//items/item').count
  end

  def test_show_gets_json
    item = Item.first
    get :show, :id => item.id, :format => :json
    assert_response 200
    parsed_response = JSON.parse(@response.body)
    assert_equal item.name, parsed_response["name"]
  end

  def test_show_gets_xml
    item = Item.first
    get :show, :id => item.id, :format => :xml
    assert_response 200
    parsed_response = Nokogiri::XML(@response.body)
    assert_equal item.name, parsed_response.at_xpath('/item/name').text
  end

  def test_post_as_json_creates_an_item
    item_data = { :name => "Flannel Fishing Net",
                  :description => "Get one now",
                  :image_url => Faker::Avatar.image }
    post :create, :format => :json, :item => item_data
    assert_response 201
    parsed_response = JSON.parse(@response.body)
    assert_equal 6, Item.count
    assert_equal "Flannel Fishing Net", Item.last.name
    assert_equal "Congrats! An item was created!", parsed_response["message"]
    assert_equal "Flannel Fishing Net", parsed_response["item"]["name"]
  end

  def test_post_as_xml_creates_an_item
    item_data = { :name => "Flannel Fishing Net",
                  :description => "Get one now",
                  :image_url => Faker::Avatar.image }
    post :create, :format => :xml, :item => item_data
    assert_response 201
    parsed_response = Nokogiri::XML(@response.body)
    assert_equal 6, Item.count
    assert_equal "Flannel Fishing Net", Item.last.name
    assert_equal "Congrats! An item was created!", parsed_response.at_xpath('//message').text
    assert_equal "Flannel Fishing Net", parsed_response.at_xpath('//item/name').text
  end

  def test_post_with_invalid_json_returns_errors
    item_data = { :name => nil,
                  :description => "Get one now",
                  :image_url => Faker::Avatar.image }
    post :create, :format => :json, :item => item_data
    assert_response 422
    parsed_response = JSON.parse(@response.body)
    assert_equal 5, Item.count
    assert_equal true, parsed_response["errors"]["name"].include?("can't be blank")
  end

  def test_post_with_invalid_xml_returns_errors
    item_data = { :name => nil,
                  :description => "Get one now",
                  :image_url => Faker::Avatar.image }
    post :create, :format => :xml, :item => item_data
    assert_response 422
    assert_equal 5, Item.count
    parsed_response = Nokogiri::XML(@response.body)
    assert_not_nil parsed_response.xpath('//errors')
  end
end
