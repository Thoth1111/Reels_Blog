class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_create :update_posts_counter

  def update_posts_counter
    post.increment!(:comments_counter)
  end

  private :update_posts_counter
end
