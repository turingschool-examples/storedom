class User < ActiveRecord::Base
  has_many :orders
  has_one :photograph, as: :photographable
end
