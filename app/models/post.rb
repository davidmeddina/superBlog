class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: {minimum: 5}
  
end
