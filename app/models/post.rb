class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  after_create :update_posts_counter

  def return_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
