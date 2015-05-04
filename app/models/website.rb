class Website < ActiveRecord::Base
  has_many :pizzas, as: :displayable
  # has pizzas
end
