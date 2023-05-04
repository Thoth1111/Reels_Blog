class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :update_users_counter

  def recent_five
    comments.order(created_at: :desc).limit(5)
  end

  def update_users_counter
    author.increment!(:posts_counter)
  end

  private :update_users_counter
end
