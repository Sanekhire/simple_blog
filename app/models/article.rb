# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }

  def created_at_formated
    created_at.strftime('%d.%m.%Y %H:%M:%S')
  end
end
