# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true, length: { minimum: 2 }

  def created_at_formated
    created_at.strftime('%d.%m.%Y %H:%M:%S')
  end
end
