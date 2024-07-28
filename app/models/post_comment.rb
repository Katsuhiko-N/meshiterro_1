class PostComment < ApplicationRecord
    
    belongs_to :user
    belong_to :post_image
    
end
