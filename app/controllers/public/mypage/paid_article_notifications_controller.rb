class ::Public::Mypage::PaidArticleNotificationsController < ::Public::Mypage::BaseController
  before_action :authenticate_user!
  before_action :set_paid_article_notification, only: [:show]

  def index
    # @paid_articles = current_user.paid_article_orders.pluck(:paid_article)
    # @paid_articles = current_user.paid_article_orders.map {|paid_article_order| paid_article_order.paid_article }
    @paid_articles = PaidArticle.joins(:paid_article_orders).where(paid_article_orders: {buyer_id: current_user.id})
    @paid_article_notifications = []
    @paid_articles.each do |paid_article|
      paid_article.paid_article_notifications.each do |notification|
        if notification.published_at >= Time.current
          @paid_article_notifications.push(notification)
        end
      end
    end
    # @paid_article_notifications.where(published_at: ..Time.current )
  end

  def show
    @paid_article = @paid_article_notification.paid_article
  end

  private

  def set_paid_article_notification
    @paid_article_notification = PaidArticleNotification.find(params[:id])
  end
end
