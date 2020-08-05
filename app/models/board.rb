class Board < ApplicationRecord
  has_many :user_boards
  has_many :users, through: :user_board
  has_many :categories

end
