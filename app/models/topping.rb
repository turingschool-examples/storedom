class Topping < ActiveRecord::Base
  has_many :topping_requests
  has_many :pizzas, through: :topping_requests
  has_many :calzones, through: :topping_requests
end
