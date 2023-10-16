class Message < ApplicationRecord
  belongs_to :friend, class_name: 'User'
end
