class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews  
   
    def favorite_product
     self.reviews.order(:star_rating).last.product
    end

    def remove_reviews(product)
        self.reviews.where(product: product).destroy_all
    end
end
