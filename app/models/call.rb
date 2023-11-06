class Call < ApplicationRecord
  belongs_to :caller, foreign_key: 'caller_id', class_name: 'User'
  belongs_to :random_user, foreign_key: 'random_user_id', class_name: 'User'
  validates :duration, presence: true, numericality: { only_integer: true }
  before_create do
    opentok = OpenTok::OpenTok.new ENV.fetch('VONAGE_API_KEY', nil), ENV.fetch('VONAGE_API_SECRET', nil)
    session = opentok.create_session
    self.session_id = session.session_id
  end
end
