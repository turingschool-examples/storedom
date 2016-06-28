class Store < ActiveRecord::Base
  before_create :create_slug

  def create_slug
    self.slug = self.name.parameterize
  end

end
