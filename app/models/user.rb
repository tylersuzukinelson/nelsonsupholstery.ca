class User < ActiveRecord::Base

  has_secure_password

  has_many :categories, dependent: :nullify
  has_many :images, dependent: :nullify

end
