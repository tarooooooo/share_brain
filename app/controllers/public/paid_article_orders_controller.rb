class Public::PaidArticleOrdersController < ::Public::BaseController
  before_action :set_paid_article, only: [:new, :confirm, :create, :done]
  before_action :set_paid_article_order, only: [:new, :confirm, :create]

  def new; end

  def confirm
    @paid_article_order.payment_method = params[:paid_article_order][:payment_method]
    render :new if @paid_article_order.invalid?
    render
  end

  def create
    render :new and return if params[:back]
    if @paid_article_order.save
      redirect_to done_public_paid_article_paid_article_orders_path(paid_artcle_id: @paid_article.id)
    else
      render :new
    end
  end

  def done; end

  private
  def set_paid_article
    @paid_article = PaidArticle.find(params[:paid_article_id])
  end

  def set_paid_article_order
    @paid_article_order = current_user.paid_article_orders.new(paid_article: @paid_article)
  end
end
