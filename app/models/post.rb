class Post < ApplicationRecord
  belongs_to :user

  has_many :post_comments, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true
end
