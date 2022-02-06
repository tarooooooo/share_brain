require "test_helper"

class Public::Mypage::TopPageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_mypage_top_page_show_url
    assert_response :success
  end
end
