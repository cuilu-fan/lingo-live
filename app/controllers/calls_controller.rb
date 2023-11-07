class CallsController < ApplicationController
  def index
  end

  def random
    opentok = OpenTok::OpenTok.new ENV.fetch('VONAGE_API_KEY', nil), ENV.fetch('VONAGE_API_SECRET', nil)
    waiting_call = Call.where(random_user: nil).where.not(caller: current_user, id: params[:old_call_ids]).first || Call.where(caller: nil).where.not(random_user: current_user, id: params[:old_call_ids]).first # rubocop:disable Layout/LineLength
    if waiting_call
      @call = waiting_call
      waiting_call.update(random_user: current_user) if waiting_call.random_user.nil?
      waiting_call.update(caller: current_user) if waiting_call.caller.nil?
    else
      @call = Call.create_or_find_by(caller: current_user, random_user: nil)
    end

    @flashcards = Translation.last(5)
    # @call.session_id = opentok.create_session.session_id
    @token = opentok.generate_token(@call.session_id)
    @hide_padding = true
  end

  def next
    # /calls/5/next
    @call = Call.find(params[:id])
    @call.update(random_user: nil) if @call.random_user == current_user
    @call.update(caller: nil) if @call.caller == current_user
    @call.destroy if @call.random_user.nil? && @call.caller.nil?
    @old_call_ids = params[:old_call_ids] || []
    @old_call_ids = Call.where(id: @old_call_ids).pluck(:id) # delete out ids for calls that were deleted already
    @old_call_ids << @call.id
    redirect_to random_calls_path(old_call_ids: @old_call_ids)
  end

  def destroy
    # /calls/5/next
    @call = Call.find(params[:id])
    @call.update(random_user: nil) if @call.random_user == current_user
    @call.update(caller: nil) if @call.caller == current_user
    @call.destroy if @call.random_user.nil? && @call.caller.nil?
    redirect_to calls_path, status: :see_other
  end
end
