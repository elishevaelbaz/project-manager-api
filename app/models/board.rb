class Board < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :categories
  has_many :labels

  def tasks
    tasks = self.categories.map {|category| category.tasks}
    tasks.flatten
  end
end
