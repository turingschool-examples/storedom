class User < ActiveRecord::Base
  has_secure_password

  validates :password, confirmation: true

  has_many :orders
end
