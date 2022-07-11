class NotificationMailer < ApplicationMailer

  layout 'notification_mailer'

  def send_mail(user, article)
    @user = user
    @article = article
    mail to: user.email, subject: "ご購入ありがとうございます！"
  end
end
