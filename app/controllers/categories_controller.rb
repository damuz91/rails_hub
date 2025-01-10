class CategoriesController < ApplicationController
  allow_unauthenticated_access only: [:index]
  def index
    @categories = Category.all
  end

  def show
  end
end
