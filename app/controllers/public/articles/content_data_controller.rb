class Public::Articles::ContentDataController < ::Public::BaseController
  before_action :authenticate_user!
  before_action :set_article
  before_action :set_article_content_data
  def new; end

  def edit
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_article_content_data
    @article_content_data = ArticleContentDatum.find_or_initialize_by(params[:id])
  end

  def article_content_data_params
    params.require(:article_content_datum).permit(
    :article_id,
    :summary,
    :price
    )
  end
end
