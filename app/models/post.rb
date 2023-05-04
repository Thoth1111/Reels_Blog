class Post < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: :author_id
    has_many :comments
    has_many :likes

    after_create :update_users_counter

    def recent_five
        comments.order(created_at: :desc).limit(5)
    end

    def increment_counter
        author.increment!(:posts_counter)
    end
end
