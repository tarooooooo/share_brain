class Public::PaidArticleNotificationsController < ApplicationController
  before_action :set_paid_article_notification, only: [:show, :edit, :update, :destroy]

  def new
    @paid_article_notification = PaidArticleNotification.new
    @paid_articles = current_user.paid_articles
  end

  def create
    @paid_article_notification = PaidArticleNotification.new(paid_article_notification_params)
    @paid_article_notification.writer = current_user
    if @paid_article_notification.save!
      redirect_to [:public, @paid_article_notification], notice: 'お知らせを作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show; end

  def index
  end

  def destroy
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
