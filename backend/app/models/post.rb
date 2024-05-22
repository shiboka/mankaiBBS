class Post < ApplicationRecord
  validates :name, presence: true
  validates :message, presence: true

  belongs_to :thred
end
