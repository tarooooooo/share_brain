class BuyerMailer < ApplicationMailer
  def welcome_email
    mail(to: "ryutaromaeda83@gmail.com", subject: 'メールのタイトルがここに入ります')
  end
end
