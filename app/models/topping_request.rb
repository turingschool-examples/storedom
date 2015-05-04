class ToppingRequest < ActiveRecord::Base
  belongs_to :topping
  belongs_to :toppable, polymorphic: true
end
