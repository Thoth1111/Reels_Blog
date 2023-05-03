class Like < ApplicationRecord
    belongs_to :author, classname: 'User', foreign_key: :author_id
    belongs_to :post
end