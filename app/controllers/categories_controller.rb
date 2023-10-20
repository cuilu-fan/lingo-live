class CategoriesController < ApplicationController
  # Max, can you please work on the index method?
  # So that all categories will be shown on the path /categories
  def index
    @categories = Category.all
  end

  # Cuilu will work on the create and show method
  # So that a user can create a category for translated words
  def create
    @category = Category.new(category_params)
    @category = @user_flashcard.category_id
    @category.default = false if @category.save
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:id, :name)
  end

end
