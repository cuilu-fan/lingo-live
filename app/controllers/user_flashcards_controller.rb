class UserFlashcardsController < ApplicationController
  def new
    @user_flashcard = UserFlashcard.new
    @categories = Category.pluck(:name)
  end

  def translate
    DeepL.configure do |config|
      config.auth_key = ENV['DEEPL_AUTH_KEY']
      config.host = 'https://api-free.deepl.com'
    end
    p source = request.body.read

    DeepL.translate 'EN', 'DE'

  end

  def create
    @user_flashcard = UserFlashcard.new(user_flashcard_params)
    @user_flashcard.user = current_user
    @user_flashcard.save
  end

  private

  def translation_params
    params.require(:body).permit(:translation)
  end

  def user_flashcard_params
    params.require(:user_flashcard).permit(:flashcard_id, :category_id)
  end
end
