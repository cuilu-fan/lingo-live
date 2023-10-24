class UserFlashcardsController < ApplicationController
  def new
    @user_flashcard = UserFlashcard.new
    @categories = Category.pluck(:name)
  end

  def translate
    to_translate = request.body.read
    translation = DeepL.translate to_translate, 'EN', 'DE'
    respond_to do |format|
      format.html
      format.text { render partial: "translation", locals: { translation: }, formats: [:html] }
    end
  end

  def create
    @user_flashcard = UserFlashcard.new(user_flashcard_params)
    @user_flashcard.user = current_user
    @user_flashcard.save
  end

  private

  def user_flashcard_params
    params.require(:user_flashcard).permit(:flashcard_id, :category_id)
  end
end
