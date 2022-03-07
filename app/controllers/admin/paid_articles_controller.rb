class Admin::PaidArticlesController < ::Admin::BaseController
  def index
    @paid_articles = PaidArticle.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
