class Review < ApplicationRecord
  belongs_to :user
  belongs_to :passport
  validates :content, length: { minimum: 20 }
end
