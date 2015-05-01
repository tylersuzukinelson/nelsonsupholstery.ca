class Referral < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :body, presence: true

  before_save :set_approved

  private

  def set_approved
    self.approved ||= false
    true
  end

end
