class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :icon_image, UserIconUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :articles, dependent: :restrict_with_error, foreign_key: :writer_id, inverse_of: :writer
  has_many :paid_articles, dependent: :restrict_with_error, foreign_key: :seller_id, inverse_of: :seller
  has_many :paid_article_orders, dependent: :restrict_with_error, foreign_key: :buyer_id, inverse_of: :buyer
  has_many :paid_article_notifications, dependent: :destroy, foreign_key: :writer_id, inverse_of: :writer
  # has_many :paid_article_sales, dependent: :restrict_with_error, foreign_key: :seller_id, inverse_of: :seller

  private
    def password_required?
      super if confirmed?
    end
end
