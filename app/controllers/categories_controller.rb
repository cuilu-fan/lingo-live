class CategoriesController < ApplicationController
  # Max, can you please work on the index method?
  # So that all categories will be shown on the path /categories
  def index
    @categories = Category.joins(:user_flashcards).uniq
  end

  # Cuilu will work on the create and show method
  # So that a user can create a category for translated words
  def show
    @category = Category.find(params[:id])
    @flashcards = UserFlashcard.where(user: current_user).joins(:translation)
  end
end
