class FriendsController < ApplicationController
  def index
    @friends = current_user.friends.where(status: "accepted")
  end

  def new
    @friend = Friend.new
    @friends = current_user.friends.map do |friend|
      friend.user_1 == current_user ? friend.user_2 : friend.user_1
    end
  end

  def create
    @friend = Friend.new
    @friend.user_1 = current_user
    @friend.user_2 = User.find(params[:friend])
    @friend.save
    redirect_to friend_request_path
  end

  def accept
    @friend = Friend.find(params[:id])
    @friend.update(status: "accepted")
    redirect_to friends_path
  end

  def create_from_call
    @friend = Friend.new
    @friend.user_1 = current_user
    @friend.user_2 = User.find(params[:friend])
    @friend.save
  end

  def friend_request
    @friend_requests = current_user.friends.where(status: "pending")
    search_query = params[:search].to_s.strip
    return if search_query == ""

    @results = User.where("first_name ILIKE ? OR user_name ILIKE ? OR email ILIKE ?", "%#{search_query}%",
                          "%#{search_query}%", "%#{search_query}%")
  end
end
