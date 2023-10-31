class UserFlashcardsController < ApplicationController
  def new
    @user_flashcard = UserFlashcard.new
    @categories = Category.pluck(:name)
    @categories_ids = Category.where(name: @categories).pluck(:id)
    @translation = "Translation here"
  end

  def translate
    to_translate = request.body.read
    translation = DeepL.translate to_translate, 'DE', 'EN'
    respond_to do |format|
      format.html
      format.text { render partial: "translation", locals: { translation: }, formats: [:html] }
    end
  end

  def create
    category_nil
    translation_nil
    @user_flashcard = UserFlashcard.new
    @user_flashcard.category = @category
    @user_flashcard.translation = @translation
    @user_flashcard.user = current_user
    @user_flashcard.save
    redirect_to new_user_flashcard_path
  end

  def update
    @flashcard = UserFlashcard.find(params[:id])
    @flashcard.known = user_flashcard_params[:known]
    if user_flashcard_params[:known] == "true"
      @flashcard.success_count += 1
    else
      @flashcard.failed_count += 1
    end
    @flashcard.save
    redirect_to category_path(@flashcard.category)
  end

  private

  def user_flashcard_params
    params.require(:user_flashcard).permit(:flashcard_id, :category_id, :known)
  end

  def category_params
    params.require(:category).permit(:category_id, :name)
  end

  def category_nil
    @category = Category.find_by(name: params[:user][:category_name])
    return unless @category.nil?

    @category = Category.new(name: params[:user][:category_name], default: false)
    @category.save
  end

  def translation_nil
    @translation = Translation.find_by(primary_language_word: params[:user][:primary],
                                       target_language_word: params[:user][:api])
    return unless @translation.nil?

    @translation = Translation.new(primary_language_word: params[:user][:primary],
                                   target_language_word: params[:user][:api])
    @translation.save
  end
end
