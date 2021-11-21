class Post < ApplicationRecord
    has_many :reservations,dependent: :destroy, foreign_key: :reservation_post_id
    attr_accessor :image_cache
    mount_uploader :image, ImageUploader
    belongs_to:user
    #belongs_to :reservation
    def user
    return User.find_by(id: self.user_id)
    end
    with_options presence: true do
    end
    validates :roomname,:roomdata,:juusyo, presence: true
    validates :kane, numericality: true
    validates :image, presence: true
   
    def self.search(search)
    if search != ""
    Post.where(['roomname LIKE(?) OR roomdata LIKE(?) OR juusyo LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
    Post.includes(:user)
    end
    end
end