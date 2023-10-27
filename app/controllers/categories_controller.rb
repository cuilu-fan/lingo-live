SUCCESS_MESSAGE = "Congrats! You have successfully remembered all the words in this category!"
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
    flashcards = UserFlashcard.flashcards_to_review(current_user, @category)
    if flashcards.empty?
      reset_review_deck
      redirect_to categories_path, notice: SUCCESS_MESSAGE
    end
    @flashcard = flashcards.first
  end

  private

  def reset_review_deck
    UserFlashcard.where(user: current_user, category: @category, known: true)
                 .map do |known_flashcard|
      known_flashcard.known = false
      known_flashcard.save!
    end
  end
end
