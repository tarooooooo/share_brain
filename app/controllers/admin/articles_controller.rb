class Admin::ArticlesController < ::Admin::BaseController
  def index
    @articles = Article.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
