class Product < ActiveRecord::Base

    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, start_rating, comment)
        Review.create(
            start_rating: start_rating, 
            comment: comment, user_id: user.id, 
            product_id: self.id
        )
    end

    def print_all_reviews
        Review.all.map do |rev|
         puts "Review for #{rev.product.name} by #{rev.user.name}: #{rev.star_rating}. #{rev.comment}"
        end
    end

    def average_rating
        self.reviews.map(&:start_rating).sum.to_f / reviews.size
    end

end
