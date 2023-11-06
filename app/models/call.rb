class Call < ApplicationRecord
  belongs_to :caller, foreign_key: 'caller_id', class_name: 'User', optional: true
  belongs_to :random_user, foreign_key: 'random_user_id', class_name: 'User' , optional: true
  before_create do
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    session = opentok.create_session
    self.session_id = session.session_id
  end
end
