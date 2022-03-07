require "test_helper"

class Admin::PaidArticleOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_paid_article_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_paid_article_orders_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_paid_article_orders_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_paid_article_orders_edit_url
    assert_response :success
  end
end
