class Post < ApplicationRecord
    before_commit :authenticate_user!
    belongs_to :user
end
