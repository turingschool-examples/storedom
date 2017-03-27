class Store < ActiveRecord::Base
  has_many :items
  validates :name, uniqueness: true
  validates :slug, uniqueness: true

  before_validation :assign_slug

  def assign_slug
    self.slug = self.name.parameterize
  end
end
