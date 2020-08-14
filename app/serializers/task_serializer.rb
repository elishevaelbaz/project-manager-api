class TaskSerializer < ActiveModel::Serializer
  # has_many :comments
  attributes :id, :name, :description, :category_id, :created_by, :position, :assigned_to
end
