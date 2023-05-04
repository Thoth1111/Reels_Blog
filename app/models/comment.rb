class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_create :update_posts_counter

  def update_posts_counter
    post.increment!(:comments_counter)
  end
end
