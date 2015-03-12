class ImagesController < ApplicationController

  before_action :authenticate_user!
  before_action :get_image, only: [:edit, :update, :destroy]
  
  def index
    @images = Image.order(created_at: :desc)
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def get_image
    @image = Image.find params[:id]
  end

  def image_params
    params.require(:image).permit(:title, :description, :alt, :image)
  end

end
