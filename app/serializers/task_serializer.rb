class TaskSerializer < ActiveModel::Serializer
  # has_many :comments
  attributes :id, :name, :description, :category_id, :created_by, :position, :assigned_to, :taskLabels
  # has_many :task_labels, as: :taskLabels

  def taskLabels
    object.task_labels
  end
end
