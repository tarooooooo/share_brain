require "test_helper"

class Public::PaidArticleMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_paid_article_messages_index_url
    assert_response :success
  end

  test "should get show" do
    get public_paid_article_messages_show_url
    assert_response :success
  end

  test "should get new" do
    get public_paid_article_messages_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_paid_article_messages_edit_url
    assert_response :success
  end
end
