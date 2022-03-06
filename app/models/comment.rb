class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :comic
  
  validates :comment, presence: true
end
