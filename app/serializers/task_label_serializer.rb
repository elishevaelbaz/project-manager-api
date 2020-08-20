class TaskLabelSerializer < ActiveModel::Serializer
  attributes :id, :task_id, :label_id#, :task_name, :label_name

  # def task_name
  #   object.task.name
  # end

  # def label_name
  #   object.label.name
  # end
end
