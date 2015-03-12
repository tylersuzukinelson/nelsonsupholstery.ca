class ImagesController < ApplicationController

  before_action :authenticate_user!
  before_action :get_image, only: [:edit, :update, :destroy]
  
  def index
    @images = Image.order(created_at: :desc).limit(10)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new image_params
    if @image.save
      redirect_to images_path
    else
      redirect_to images_path, alert: get_errors
    end
  end

  def edit
  end

  def update
    if @image.update image_params
      redirect_to images_path
    else
      redirect_to images_path, alert: get_errors
    end
  end

  def destroy
    @image.destroy
  end

  private

  def get_image
    @image = Image.find params[:id]
  end

  def image_params
    params.require(:image).permit(:title, :description, :alt, { 'category_ids' => [] }, :image)
  end

  def get_errors
    @image.errors.full_messages.join('; ')
  end

end
