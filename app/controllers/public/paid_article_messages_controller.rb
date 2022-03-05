class Public::PaidArticleMessagesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_paid_article_message
    @paid_article_message = PaidArticleMessage.find(params[:id])
  end

  def paid_article_message_params
    params.require(:paid_article_message).permit(
    :writer_id,
    :paid_article_id,
    :title,
    :body,
    :publish_status
    )
  end
end
