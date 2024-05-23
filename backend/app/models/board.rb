class Board < ApplicationRecord
  validates :path, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :threds, dependent: :destroy
end
