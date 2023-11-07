class CallChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    call = Call.find(params[:id])
    stream_for call
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    @call = Call.find(params[:id])
    @user = User.find(params[:user_id])
    @call.update(random_user: nil) if @call.random_user == @user
    @call.update(caller: nil) if @call.caller == @user
    @call.destroy if @call.random_user.nil? && @call.caller.nil?
  end
end
