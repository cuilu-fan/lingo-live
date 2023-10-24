class UserFlashcardsController < ApplicationController
  def new
    @user_flashcard = UserFlashcard.new
    @categories = Category.pluck(:name)
    @categories_ids = Category.where(name: @categories).pluck(:id)
  end

  def create

    @category = Category.find_by(name: params[:user][:category_name])
    @translation = Translation.find_by(primary_language_word: params[:user][:translation])
    @user_flashcard = UserFlashcard.new()
    @user_flashcard.category = @category
    @user_flashcard.translation = @translation
    @user_flashcard.user = current_user
    @user_flashcard.save
    redirect_to new_user_flashcard_path
  end

  private

  def user_flashcard_params
    params.require(:user_flashcard).permit(:flashcard_id, :category_id)
  end

  def category_params
    params.require(:category).permit(:category_id, :name)
  end
end
