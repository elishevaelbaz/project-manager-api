class UserBoardSerializer < ActiveModel::Serializer
  attributes :board_id, :username
  # belongs_to :user

  def username
    object.user.username
  end
end
