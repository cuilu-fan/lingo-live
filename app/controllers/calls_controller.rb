class CallsController < ApplicationController
  def index
  end

  def show
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    @call = Call.new
    @token = opentok.generate_token @call.session_id, { name: current_user.first_name }
  end

  def create
    @call = Call.new
    @call.caller = current_user
    @call.random_user = User.except(current_user).sample
    @call.save
    redirect_to call_path(@call)
  end
end
