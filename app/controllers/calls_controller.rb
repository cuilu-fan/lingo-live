class CallsController < ApplicationController
  def index

  end

  def show
    @call = Call.find(params[:id])
    @call_user = CallUser.new
  end
end
