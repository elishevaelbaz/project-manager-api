class User < ApplicationRecord
  has_many :user_boards
  has_many :boards, through: :user_board

  has_many :comments

  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }

end
