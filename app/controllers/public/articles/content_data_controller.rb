class Public::Articles::ContentDataController < ::Public::BaseController
  before_action :authenticate_user!
  before_action :set_article
  before_action :set_article_content_datum
  def new; end

  def create
    @article_content_datum = ArticleContentDatum.new(article_content_datum_params)
    @article_content_datum.article = @article
    ::Articles::CreateContentDatumWorkflow.run!(
      article_content_datum: @article_content_datum,
      article: @article
    )
    redirect_to [:public, @article], notice: '商品情報を作成しました'

    rescue StandardError => e
      redirect_to [:public, @article], alert: e.message
  end

  def edit; end

  def update
    if @article_content_datum.update(article_content_datum_params)
      redirect_to [:public, @article], noticle: '商品情報を更新しました'
    else
      render :edit
    end
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_article_content_datum
    @article_content_datum = ArticleContentDatum.find_or_initialize_by(article: @article)
  end

  def article_content_datum_params
    params.require(:article_content_datum).permit(
    :article_id,
    :summary,
    :price
    )
  end
end
