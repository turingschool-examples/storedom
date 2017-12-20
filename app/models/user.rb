class User < ActiveRecord::Base
  has_secure_password

  belongs_to :store
  has_many :orders
  has_many :user_roles
  has_many :roles, through: :user_roles

  def registered_user?
    roles.exists?(name: "registered_user")
  end

  def store_admin?
    roles.exists?(name: "store_admin")
  end

  def platform_admin?
    roles.exists?(name: "platform_admin")
  end
end
