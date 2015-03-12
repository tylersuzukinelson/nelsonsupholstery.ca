class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: :show
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
    @images = @category.images.limit(10)
  end

  def edit
  end

  def update
    @category.update category_params
    respond_to do |format|
      format.js { render }
    end
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
    params.require(:category).permit(:title)
  end

end
