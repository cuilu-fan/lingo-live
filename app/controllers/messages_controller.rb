class MessagesController < ApplicationController
  def create
    @message = Message.new(params_message)
    @message.save
  end

  private

  def params_message
    params.require(:message).permit(:content)
  end
end
