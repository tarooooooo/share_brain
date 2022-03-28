class Public::PaidArticleOrdersController < ::Public::BaseController
  before_action :authenticate_user!
  before_action :set_paid_article, only: [:new, :confirm, :create, :done]
  before_action :set_paid_article_order, only: [:new, :confirm, :create]
  before_action :set_article, only: [:new, :confirm, :create, :done]
  before_action :set_article_order, only: [:new, :confirm, :create]

  def new; end

  def confirm
    if @paid_article.present?
      @paid_article_order.payment_method = params[:paid_article_order][:payment_method]
      render :new unless @paid_article_order.payment_method.present?
    else
      @article_order.payment_method = params[:paid_article_order][:payment_method]
      render :new unless @article_order.payment_method.present?
    end
  end

  def create
    if @paid_article_order.present?
      ::PaidArticleOrders::CreateWorkflow.run!(paid_article_order: @paid_article_order)
      redirect_to public_paid_article_path(@paid_article)
    else
      ::ArticleOrders::CreateWorkflow.run!(paid_article_order: @article_order)
      redirect_to public_article_path(@article)
    end


  rescue StandardError => e
    redirect_to public_paid_articles_path, alert: e.message
  end

  private
  def set_paid_article
    @paid_article = PaidArticle.find(params[:paid_article_id]) if params[:type] == "paid_article"
  end

  def set_article
    @article = Article.find(params[:paid_article_id])
  end

  def set_paid_article_order
    @paid_article_order = current_user.paid_article_orders.new(paid_article: @paid_article) if params[:type] == "paid_article"
  end

  def set_article_order
    @article_order = current_user.paid_article_orders.new(article: @article)
  end

end
