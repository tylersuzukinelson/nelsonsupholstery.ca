class SiteContent < ActiveRecord::Base

  validates :page, presence: true, uniqueness: true

  before_save :format_content

  private

  def format_content
    self.content = ActionController::Base.helpers.sanitize(content, tags: %w(strong em p br a), attributes: %w(href)) unless content.nil?
    self.content = content.gsub(/\r\n/, '<br>').gsub(/\r/, '<br>').gsub(/\n/, '<br>') unless content.nil?
  end

end
