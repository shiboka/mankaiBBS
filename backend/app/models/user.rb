class User < ApplicationRecord
  require "securerandom"

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  def role?(name)
    roles.pluck(:name).member?(name.to_s)
  end
end
