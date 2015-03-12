class CategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :get_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.order(title: :asc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    @category.save
    respond_to do |format|
      format.js { render }
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.js { render }
    end
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
