class Comment < ActiveRecord::Base
    validates :content, presence: true
    belongs_to :user
    default_scope -> { order('created_at DESC') }
end
