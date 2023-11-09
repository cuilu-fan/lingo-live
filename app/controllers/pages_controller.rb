class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    @translations = current_user.translations.last(2)
  end
end
