class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @translations = Translation.last(4)
  end
end
