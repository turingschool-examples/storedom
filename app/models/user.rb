class User < ActiveRecord::Base
  has_secure_password

  has_many :user_roles
  has_many :roles, through: :user_roles

  belongs_to :store
  has_many :orders

  def platform_admin?
    roles.exists?(name: "platform_admin")
  end

  def store_admin?
    roles.exists?(name: "store_admin")
  end

  def user?
    roles.exists?(name: "user")
  end
end
