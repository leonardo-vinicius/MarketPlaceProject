class Comment < ApplicationRecord
  belongs_to :software
  belongs_to :buyer, class_name: 'User', foreign_key: 'user_id'

  validates :rating, presence: true,
            numericality: { only_integer: true, 
                          greater_than_or_equal_to: 1,
                          less_than_or_equal_to: 5 }
  validates :content, presence: true
end