class Friend < ApplicationRecord
  belongs_to :user_1, foreign_key: 'user_1_id', class_name: 'User'
  belongs_to :user_2, foreign_key: 'user_2_id', class_name: 'User'
  has_many :chatrooms
  validates :user_1_id, uniqueness: { scope: :user_2_id }
end
