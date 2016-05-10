class Store < ActiveRecord::Base
  before_create :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end
end
