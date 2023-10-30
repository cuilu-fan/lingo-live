class Message < ApplicationRecord
  belongs_to :friend, foreign_key: 'friend_id', class_name: 'Friend'
  belongs_to :sender, foreign_key: 'sender_id', class_name: 'User'
end
