class CallsController < ApplicationController
  def new
    @call = Call.new
  end

  def random
    opentok = OpenTok::OpenTok.new "47801941", "55cbe0f76611e46f7c79d86f2b23b2c60296fbea"
    @call = Call.new
    @call.session_id = opentok.create_session.session_id
    @token = opentok.generate_token(@call.session_id)
  end

  def create
    @call = Call.find(params[:id])
    @call.caller = current_user
    @call.random_user = User.except(current_user).sample
    @call.session_id = params[:session_id]
    @call.save
    redirect_to call_path(@call)
  end
end
