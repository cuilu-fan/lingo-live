class Chatroom < ApplicationRecord
  belongs_to :friend
  has_many :messages
end
