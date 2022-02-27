class Public::PaidArticleOrdersController < ::Public::BaseController
  before_action :set_paid_article, only: [:new, :confirm, :create]
  before_action :set_paid_article_order, only: [:new, :confirm, :create, :done]

  def new; end

  def confirm
    @paid_article_order.payment_method = params[:paid_article_order][:payment_method]
    render :new if @paid_article_order.invalid?
    render
  end

  def create
    render :new and return if params[:back]
    if @paid_article_order.save
      redirect_to public_done_path
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
