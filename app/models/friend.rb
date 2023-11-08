class Friend < ApplicationRecord
  belongs_to :user_1, foreign_key: 'user_1_id', class_name: 'User'
  belongs_to :user_2, foreign_key: 'user_2_id', class_name: 'User'
  belongs_to :requested_by, foreign_key: 'requested_by_id', class_name: 'User', optional: true
  has_one :chatroom, dependent: :destroy
  validates :user_1_id, uniqueness: { scope: :user_2_id }
  enum :status, %i[pending accepted declined]
end
