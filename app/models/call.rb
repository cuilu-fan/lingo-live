class Call < ApplicationRecord
  belongs_to :caller, foreign_key: 'caller_id', class_name: 'User'
  belongs_to :random_user, foreign_key: 'random_user_id', class_name: 'User'
  validates :duration, presence: true, numericality: { only_integer: true }
  before_create do
    opentok = OpenTok::OpenTok.new "47801941", "55cbe0f76611e46f7c79d86f2b23b2c60296fbea"
    session = opentok.create_session
    self.session_id = session.session_id
  end
end
