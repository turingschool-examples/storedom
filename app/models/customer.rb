class Customer < ActiveRecord::Base
  has_one :login
end
