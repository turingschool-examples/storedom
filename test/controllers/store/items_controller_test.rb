require "test_helper"

class Store::ItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

  def test_show
    get :show
    assert_response :success
  end

end
