class ImageCategory < ActiveRecord::Base

  belongs_to :image
  belongs_to :category

  accepts_nested_attributes_for :category
  
end
