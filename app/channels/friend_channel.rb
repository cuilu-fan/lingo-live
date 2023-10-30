class FriendChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    friend = Friend.find(params[:id])
    stream_for friend
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
