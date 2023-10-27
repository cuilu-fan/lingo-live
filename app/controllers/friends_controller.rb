class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
