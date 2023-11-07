SUCCESS_MESSAGE = "Amazing! You have successfully remembered all the words in this category!🚀"
class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.joins(:user_flashcards).uniq
  end

  def show
    @category = Category.find(params[:id])
    flashcards = UserFlashcard.flashcards_to_review(current_user, @category)
    if flashcards.empty?
      redirect_to categories_path, notice: SUCCESS_MESSAGE
      reset_review_deck
    end

    @flashcard = flashcards.first
  end

  private

  def reset_review_deck
    UserFlashcard.where(user: current_user, category: @category, known: true)
                 .map do |known_flashcard|
      known_flashcard.known = !known_flashcard.known
      known_flashcard.save!
    end
  end
end
