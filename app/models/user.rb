class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :icon_image, UserIconUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :articles, dependent: :restrict_with_error, foreign_key: :writer_id, inverse_of: :writer
  private
    def password_required?
      super if confirmed?
    end
end
