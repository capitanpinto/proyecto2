require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get cyrwheel" do
    get static_pages_cyrwheel_url
    assert_response :success
  end

end
