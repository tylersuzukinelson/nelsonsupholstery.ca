class Image < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :user

  has_many :image_categories, dependent: :destroy
  has_many :categories, through: :image_categories

end
