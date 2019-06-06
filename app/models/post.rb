# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :content, length: { minimum: 5 }
end
