class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :username
  # belongs_to :user

  def username
    user = User.find_by(id: object.user_id)
    user.username
  end
end
