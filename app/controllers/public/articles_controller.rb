class Public::ArticlesController < ::Public::BaseController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all

  end

  def show
    @knowledge_tags = @article.knowledge_tags
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.writer = current_user
    if @article.save
      redirect_to [:public, @article], notice: '記事を作成しました。'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to [:public, @article], notice: '記事を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy!
    redirect_to public_articles_path, notice: '記事を削除しました'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :writer_id, :title, :content, :published_at, :publish_status, :deleted_at, knowledge_tag_ids: []
    )
  end
end
