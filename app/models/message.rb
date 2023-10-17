class Message < ApplicationRecord
  belongs_to :friend, foreign_key: 'friend_id', class_name: 'Friend'
end
