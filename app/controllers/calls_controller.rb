class CallsController < ApplicationController
  def index
  end

  def show
    opentok = OpenTok::OpenTok.new ENV.fetch('VONAGE_API_KEY', nil), ENV.fetch('VONAGE_API_SECRET', nil)
    @call = Call.new
    @token = opentok.generate_token @call.session_id, { name: current_user.first_name }
  end

  def create
    @call = Call.find(params[:call_id])
    @call.caller = current_user
    @call.random_user = User.except(current_user).sample
    @call.session_id = params[:session_id]
    @call.save
    redirect_to call_path(@call)
  end
end
