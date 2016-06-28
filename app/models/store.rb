class Store < ActiveRecord::Base
  has_many :items

  before_create :create_slug

  def create_slug
    self.slug = self.name.parameterize
  end

end
