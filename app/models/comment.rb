class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_create :increment_posts_counter
  after_destroy :decrement_posts_counter

  def increment_posts_counter
    post.increment!(:comments_counter)
  end

  def decrement_posts_counter
    post.decrement!(:comments_counter)
  end

  private :increment_posts_counter, :decrement_posts_counter
end
