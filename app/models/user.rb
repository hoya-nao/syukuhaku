class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :profile, length: { maximum: 250 }
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  attr_accessor :current_password
  has_many :posts,dependent: :destroy, foreign_key: :post_user_id
  has_many :reservations
end
