class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :star_rating
      t.string :comment
    end
  end
end
