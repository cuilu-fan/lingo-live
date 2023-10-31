class MessagesController < ApplicationController
  def create # rubocop:disable Metrics/MethodLength
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(params_message)
    @message.chatroom = @chatroom
    @message.sender = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "chatroom/show", status: :unprocessable_entity
    end
  end

  private

  def params_message
    params.require(:message).permit(:text)
  end
end
