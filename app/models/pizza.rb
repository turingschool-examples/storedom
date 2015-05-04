class Pizza < ActiveRecord::Base
  has_many :topping_requests, as: :toppable
  has_many :toppings, through: :topping_requests
  belongs_to :displayable, polymorphic: true
end
