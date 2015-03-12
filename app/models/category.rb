class Category < ActiveRecord::Base

  belongs_to :user

  has_many :image_categories, dependent: :destroy
  has_many :images, through: :image_categories

end
