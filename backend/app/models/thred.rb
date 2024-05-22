class Thred < ApplicationRecord
  validates :subject, presence: true

  belongs_to :board
  has_many :posts, dependent: :destroy

  def serialize
    { id:, subject:, post_num:, posts: }
  end

  def preview
    thred_hash = { id:, subject:, post_num:, posts: [] }

    thred_hash[:posts].push(posts.first)

    posts.last(3).each do |x|
      thred_hash[:posts].push(x) unless x == posts.first
    end

    thred_hash
  end
end
