class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_create :update_posts_counter

  def update_posts_counter
    post.increment!(:likes_counter)
  end
end
