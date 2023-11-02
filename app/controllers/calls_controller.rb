class CallsController < ApplicationController
  def index
  end

  def show
    opentok = OpenTok::OpenTok.new ENV['Vonage_API_KEY'], ENV['Vonage_API_SECRET'] # rubocop:disable Style/FetchEnvVar
    @token = opentok.generate_token, @call.session_id, { name: current_user.first_name }
  end
end
