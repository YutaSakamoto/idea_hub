require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get recommend" do
    get categories_recommend_url
    assert_response :success
  end

end
