class HomeController < ApplicationController

  def index
    @images = Image.order(created_at: :desc)
    @content = SiteContent.find_by_page("Home").content
  end

  def about
    @content = SiteContent.find_by_page("About").content
  end

  def new_mail
    @content = SiteContent.find_by_page("Contact").content
    render :new_mail
  end

  def create_mail
    ContactMailer.send_message(params[:name], params[:email], params[:message]).deliver
    flash.now[:notice] = "Your message has been sent. We will respond as soon as possible."
    render :new_mail
  end

end
