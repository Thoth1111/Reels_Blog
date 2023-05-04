class User < ApplicationRecord
    has_many :posts, foreign_key: :author_id, dependent: :destroy
    has_many :comments, through: :posts
    has_many :likes, through: :posts

    def recent_three
        posts.order(created_at: :desc).limit(3)
    end
end
