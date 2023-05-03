class Post < ApplicationRecord
    belongs to :User
    has_many :comments
    has_many :likes
end
