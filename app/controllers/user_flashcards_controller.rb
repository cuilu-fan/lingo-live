class UserFlashcardsController < ApplicationController
  def new
    @user_flashcard = UserFlashcard.new
    categories = Category.all
    @categories = categories.map(&:name)
  end

  def create
    @user_flashcard = UserFlashcard.new(user_flashcard_params)
    @user_flashcard.user = current_user
    @user_flashcard.save
  end

  def create_category
    @category = current_user.category_id
    @category_new = Category.new
    @category_new.save if @category.default == false
  end

  private

  def user_flashcard_params
    params.require(:user_flashcard).permit(:flashcard_id, :category_id)
  end

  def category_params
    params.require(:category).permit(:category_id, :name, :default)
  end
end
