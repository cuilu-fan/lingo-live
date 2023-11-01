class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def new
    @friend = Friend.new
    @friends = current_user.friends.map do |friend|
      friend.user_1 == current_user ? friend.user_2 : friend.user_1
    end
  end

  def create
    @friend = User.find(params[:id])
    @friends = current_user.friends << friend
    redirect_to friend_path, notice: "#{friend.username} is now your friend."
  end

  def friend_request
    
  end

end
