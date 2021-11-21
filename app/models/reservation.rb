class Reservation < ApplicationRecord
    belongs_to :post
    attr_accessor :image_cache
    mount_uploader :image, ImageUploader
    
    #validates :nanmei, numericality: true
    #validates :hajime, presence: true
    #validates :owari, presence: true
    
    def post
    return Post.find_by(id: self.post_id)
    end
    
end
