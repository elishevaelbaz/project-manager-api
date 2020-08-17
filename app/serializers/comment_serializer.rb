class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :username, :avatar
  # belongs_to :user

  def username
    user = User.find_by(id: object.user_id)
    user.username
  end

  def avatar
    object.user.avatar
  end
end
