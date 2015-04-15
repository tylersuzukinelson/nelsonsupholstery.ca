class HomeController < ApplicationController

  def index
    @images = Image.order(created_at: :desc)
  end

  def new_mail
    render :new_mail
  end

  def create_mail
    ContactMailer.send_message(params[:name], params[:email], params[:message]).deliver
    flash.now[:notice] = "Your message has been sent. We will respond as soon as possible."
    render :new_mail
  end

end
