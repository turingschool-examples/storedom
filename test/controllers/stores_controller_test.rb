require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    s = Store.create(name: "worace's workshop")
    get :show, id: s.id
    assert_response :success
  end

end
