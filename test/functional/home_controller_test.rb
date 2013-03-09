require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  test "should get catalog" do
    get :catalog
    assert_response :success
    assert_select '.home-controller.catalog-action .book-row', minimum: 1
  end
end
