class Chatroom < ApplicationRecord
  # belongs_to :friend
  has_many :messages

  def friend(current_user)
    friend = Friend.find(friend_id)
    [friend.user_1, friend.user_2].reject { |user| user == current_user }.first
  end
end
