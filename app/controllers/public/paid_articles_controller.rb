class Public::PaidArticlesController < ::Public::BaseController
  before_action :authenticate_user!
  before_action :set_paid_article, only: [:show, :edit, :update, :destroy]

  def index
    @paid_articles = PaidArticle.all
  end

  def show; end

  def new
    @paid_article = PaidArticle.new
  end

  def create
    @paid_article = PaidArticle.new(paid_article_params)
    @paid_article.time_current_in_published_at
    @paid_article.seller = current_user
    if @paid_article.save!
      redirect_to [:public, @paid_article], notice: '有料記事を作成しました'
    else
      render :new
    end
  end

  def edit; end

  def update
    @paid_article.time_current_in_published_at
    if @paid_article.update(paid_article_params)
      redirect_to [:public, @paid_article], notice: '有料記事を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @paid_article.destroy!
    redirect_to public_articles_path, notice: '有料記事を削除しました'
  end

  private
    def set_paid_article
      @paid_article = PaidArticle.find(params[:id])
    end

  def paid_article_params
    params.require(:paid_article).permit(
      :seller_id,
      :title,
      :body,
      :published_at,
      :price,
      :publish_status,
      :attachment_file
    )
  end

end
