class Attachment < ApplicationRecord
  belongs_to :task
  belongs_to :user
end
