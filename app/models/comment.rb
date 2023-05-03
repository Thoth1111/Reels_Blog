class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :author, classname: 'User', foreign_key: :author_id
end