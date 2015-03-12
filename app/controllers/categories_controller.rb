class CategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :get_category

  def index

  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def get_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit('title')
  end

  def get_errors
    @category.errors.full_messages.join('; ')
  end

end
