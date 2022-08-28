class ::Public::Mypage::PaidArticleNotificationsController < ::Public::Mypage::BaseController
  before_action :authenticate_user!
  before_action :set_paid_article_notification, only: [:show, :edit, :update, :destroy]

  def new
    @paid_article_notification = PaidArticleNotification.new
    @paid_articles = current_user.paid_articles
    @paid_article_notifications = current_user.paid_article_notifications
  end

  def create
    @paid_article_notification = PaidArticleNotification.new(paid_article_notification_params)
    @paid_article_notification.writer = current_user
    if @paid_article_notification.save
      redirect_to new_public_mypage_paid_article_notification_path, notice: 'お知らせを作成しました'
    else
      @paid_articles = current_user.paid_articles
      @paid_article_notifications = current_user.paid_article_notifications
      render :new
    end
  end

  def edit
    @paid_articles = current_user.paid_articles
  end

  def update
    if @paid_article_notification.update(paid_article_notification_params)
      redirect_to new_public_mypage_paid_article_notification_path, notice: 'お知らせを更新しました'
    else
      @paid_articles = current_user.paid_articles
      render :edit
    end
  end

  def index
    # 学習用に、自分の実装をコメントとして残す
    # @paid_articles = PaidArticle.joins(:paid_article_orders).where(paid_article_orders: {buyer: current_user})
    # @paid_article_notifications = []
    # @paid_articles.each do |paid_article|
    #   paid_article.paid_article_notifications.each do |notification|
    #     if notification.published_at >= Time.current
    #       @paid_article_notifications.push(notification)
    #     end
    #   end
    # end
    paid_article_ids = PaidArticle.joins(:paid_article_orders).where(paid_article_orders: {buyer_id: current_user.id}).ids
    @paid_article_notifications = PaidArticleNotification.published.joins(:paid_article).where(paid_articles: { id: paid_article_ids}).order(published_at: :desc)
  end

  def show
    @paid_article = @paid_article_notification.paid_article
  end

  def destroy
    @paid_article_notification.destroy!
    redirect_to new_public_mypage_paid_article_notification_path, notice: 'お知らせを削除しました'
  end

  private
    def set_paid_article_notification
      @paid_article_notification = PaidArticleNotification.find(params[:id])
    end

    def paid_article_notification_params
      params.require(:paid_article_notification).permit(
        :title,
        :body,
        :published_at,
        :paid_article_id,
        :writer_id
      )
    end
end
