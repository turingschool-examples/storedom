class User < ActiveRecord::Base
  has_secure_password

  belongs_to :store
  has_many :orders
end
