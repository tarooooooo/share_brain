require "test_helper"

class Public::TopPageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_top_page_show_url
    assert_response :success
  end
end
