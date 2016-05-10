class Store < ActiveRecord::Base
  before_create :generate_slug

  has_many :items

  def generate_slug
    self.slug = name.parameterize
  end
end
