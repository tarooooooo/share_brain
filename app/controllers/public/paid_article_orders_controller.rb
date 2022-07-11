class Public::PaidArticleOrdersController < ::Public::BaseController
  before_action :authenticate_user!
  before_action :set_paid_article, only: [:new, :confirm, :create, :done]
  before_action :set_paid_article_order, only: [:new, :confirm, :create]

  def new; end

  def confirm
    @paid_article_order.payment_method = params[:paid_article_order][:payment_method]
    render :new if @paid_article_order.invalid?
    render
  end

  def create
    if @paid_article_order.present?
      ::PaidArticleOrders::CreateWorkflow.run!(paid_article_order: @paid_article_order)
      redirect_to public_paid_article_path(@paid_article)
    else
      ::ArticleOrders::CreateWorkflow.run!(paid_article_order: @article_order)
      redirect_to public_article_path(@article)
    end

    NotificationMailer.send_mail(current_user, @article).deliver_later

  rescue StandardError => e
    redirect_to public_paid_article_path, alert: e.message
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
