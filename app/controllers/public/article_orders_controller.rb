class Public::ArticleOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:new, :confirm, :create, :done]
  before_action :set_article_order, only: [:new, :confirm, :create]

  def new; end

  def confirm
    @paid_article_order.payment_method = params[:paid_article_order][:payment_method]
    render :new if @paid_article_order.invalid?
    render
  end

  def create
    render :new and return if params[:payment_method]
    ::PaidArticleOrders::CreateWorkflow.run!(paid_article_order: @paid_article_order)
    redirect_to done_public_paid_article_paid_article_orders_path(paid_article_id: @paid_article.id)

  rescue StandardError => e
    redirect_to public_paid_article_path, alert: e.message
  end

  def done; end

  private
  def set_paid_article
    @article = Article.find(params[:article_id])
  end

  def set_paid_article_order
    @article_order = current_user.paid_article_orders.new(article: @article)
  end
end
