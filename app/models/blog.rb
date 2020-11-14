class Blog < ApplicationRecord
  validates :title, :body, :author,
    presence: true,
    length: { minimum: 1, maximum: 140 }
end