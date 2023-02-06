require "test_helper"

class Public::Articles::ContentDataControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_articles_content_data_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_articles_content_data_edit_url
    assert_response :success
  end
end
