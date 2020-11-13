class Blog < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 140 }
  validates :body,
    presence: true,
    length: { minimum: 1, maximum: 140 }
  validates :author,
    presence: true,
    length: { minimum: 1, maximum: 140 }
end