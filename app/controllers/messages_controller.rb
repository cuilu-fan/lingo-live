class MessagesController < ApplicationController
  def create
    @chatroom = Friend.find(params[:friend_id])
    @message = Message.new(params_message)
    @message.friend = @chatroom
    @message.friend.user_1 = current_user
    if @message.save
      redirect_to friend_path(@chatroom)
    else
      render "friends/show", status: :unprocessable_entity
    end
  end

  private

  def params_message
    params.require(:message).permit(:text)
  end
end
