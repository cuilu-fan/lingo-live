class ChatroomsController < ApplicationController
  def show
    @freeze_screen = true
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    friend = Friend.find(params[:friend_id])
    chatroom = Chatroom.new(friend_id: friend.id)
    redirect_to chatroom_path(chatroom) if chatroom.save
  end
end
