class Store < ActiveRecord::Base
  belongs_to :user
  has_many :items

  

  def set_slug
    slug = name.parameterize
  end
end
