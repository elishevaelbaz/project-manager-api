class User < ApplicationRecord
  has_many :memberships
  has_many :boards, through: :memberships

  has_many :comments

  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }

end
