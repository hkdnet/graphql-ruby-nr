class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :created_by, class_name: 'User'

  validates :body, presence: true
end
