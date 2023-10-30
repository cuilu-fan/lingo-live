class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(params_message)
    @message.chatroom = @chatroom
    @message.sender = current_user
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
