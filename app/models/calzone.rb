class Calzone < ActiveRecord::Base
  has_many :topping_requests, as: :toppable
  has_many :toppings, through: :topping_requests
end
