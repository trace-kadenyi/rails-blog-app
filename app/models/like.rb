class Like < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  belongs_to :posts, foreign_key: 'post_id', class_name: 'Post'
  after_create :update_likes_counter

  def update_likes_counter
    posts.increment!(:likes_counter)
  end
end
