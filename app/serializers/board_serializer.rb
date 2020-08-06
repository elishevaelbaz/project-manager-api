class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :owner_id
end