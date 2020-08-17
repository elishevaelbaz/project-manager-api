class MembershipSerializer < ActiveModel::Serializer
  attributes :board_id, :username, :avatar
  # belongs_to :user

  def username
    object.user.username
  end

  def avatar
    object.user.avatar
  end
end
