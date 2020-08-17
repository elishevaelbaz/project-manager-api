class BoardSerializer < ActiveModel::Serializer
  attributes :id, :image, :task_id, :user_id, :username
  # belongs_to :user

  def username
    user = User.find_by(id: object.user_id)
    user.username
  end
end