class UserFlashcardsController < ApplicationController
  def new
    @user_flashcard = UserFlashcard.new
    @categories = Category.pluck(:name)
  end

  def create
    raise
    @user_flashcard = UserFlashcard.new(user_flashcard_params)
    @user_flashcard.user = current_user
    @user_flashcard.save
    @category = Category.new(category_params)
    @category.save
  end

  private

  def user_flashcard_params
    params.require(:user_flashcard).permit(:flashcard_id, :category_id)
  end

  def category_params
    params.require(:category).permit(:category_id, :name)
  end
end
