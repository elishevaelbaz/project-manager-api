class LabelSerializer < ActiveModel::Serializer  
  attributes :id, :name, :color, :board_id
  # has_many :task_labels

end
