require "test_helper"

class Public::PaidArticles::ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_paid_articles_content_index_url
    assert_response :success
  end

  test "should get show" do
    get public_paid_articles_content_show_url
    assert_response :success
  end

  test "should get new" do
    get public_paid_articles_content_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_paid_articles_content_edit_url
    assert_response :success
  end
end
