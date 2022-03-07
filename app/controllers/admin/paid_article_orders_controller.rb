class Admin::PaidArticleOrdersController < ::Admin::BaseController
  def index
    @paid_article_orders = PaidArticleOrder.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
