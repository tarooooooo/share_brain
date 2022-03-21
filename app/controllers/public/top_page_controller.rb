class Public::TopPageController < ::Public::BaseController
  def show


    @paid_articles = PaidArticle.joins(:content).order(published_at: :desc).limit(10)
  end
end
