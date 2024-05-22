class Board < ApplicationRecord
  validates :path, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :threds, dependent: :destroy

  def serialize
    board_hash = { id:, name:, path:, threds: [] }

    threds.each do |t|
      board_hash[:threds].push(t.preview)
    end

    board_hash[:threds].sort_by! { |t| t[:posts].last.created_at }.reverse!

    board_hash
  end
end
