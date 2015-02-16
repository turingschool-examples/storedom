class Store < ActiveRecord::Base
  has_many :items
  has_many :orders
  has_many :users
end
