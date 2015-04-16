class SiteContentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @site_contents = SiteContent.order(page: :asc)
  end

  def update
    @site_content = SiteContent.find params[:id]
    @site_content.update params.require(:site_content).permit(:content)
    redirect_to site_contents_path
  end

end
