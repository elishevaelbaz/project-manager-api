class Category < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  validates :name, uniqueness: { scope: :board_id }
end

#{ order(position: :asc) }#,