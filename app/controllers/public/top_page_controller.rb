class Public::TopPageController < ::Public::BaseController
  def show
    @articles = Article.all
  end
end
