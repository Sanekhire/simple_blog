class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true, length: {minimum: 2} 
end
