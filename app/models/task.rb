class Task < ApplicationRecord
  has_many :comments, dependent: :destroy

  has_many :attachments, dependent: :destroy

  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels

  has_many :mentions, dependent: :destroy

  belongs_to :category
  acts_as_list scope: :category

  validates :name, presence: true
  validates :category_id, presence: true


end
