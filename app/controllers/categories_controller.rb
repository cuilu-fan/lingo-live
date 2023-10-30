SUCCESS_MESSAGE = "Congrats! You have successfully remembered all the words in this category!"
class CategoriesController < ApplicationController
  def index
    @categories = Category.joins(:user_flashcards).uniq
  end

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
