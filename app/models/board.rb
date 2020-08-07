class Board < ApplicationRecord
  has_many :user_boards
  has_many :users, through: :user_boards
  has_many :categories

  def tasks
    tasks = self.categories.map {|category| category.tasks}
    tasks.flatten
  end
end
