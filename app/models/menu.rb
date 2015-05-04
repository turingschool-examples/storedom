class Menu < ActiveRecord::Base
  # has pizzas
  has_many :pizzas, as: :displayable
end
