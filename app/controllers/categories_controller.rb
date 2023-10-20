class CategoriesController < ApplicationController
  # Max, can you please work on the index method?
  # So that all categories will be shown on the path /categories
  def index
    @categories = Category.all
  end

  # Cuilu will work on the create and show method
  # So that a user can create a category for translated words

  def show
  end

  def create
  end
end
