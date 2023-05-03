class User < ApplicationRecord
    has_many :posts, foreign_key: :author_id
    has_many :comments, through: :posts
    has_many :likes, through: :posts
end
