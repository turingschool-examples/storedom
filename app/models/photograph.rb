class Photograph < ActiveRecord::Base
  belongs_to :photographable, polymorphic: true
end
