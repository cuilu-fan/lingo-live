class CallsController < ApplicationController
  def new
    @call = Call.new
  end

  def random
    opentok = OpenTok::OpenTok.new ENV['VONAGE_API_KEY'], ENV['VONAGE_API_SECRET']
    @cuilu = User.find_by(user_name: "lulu")
    @call = Call.find_by(random_user: @cuilu)
    # @call.session_id = opentok.create_session.session_id
    @token = opentok.generate_token(@call.session_id)
  end

  @call = Call.new
  def create
    @call.caller = current_user
    @call.random_user = User.except(current_user).sample
    @call.session_id = params[:session_id]
    @call.save
    redirect_to call_path(@call)
  end
end
