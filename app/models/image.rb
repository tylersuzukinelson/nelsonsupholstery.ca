class Image < ActiveRecord::Base

  belongs_to :user

  has_many :image_categories, dependent: :destroy
  has_many :categories, through: :image_categories

end
