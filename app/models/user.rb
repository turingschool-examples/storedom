class User < ActiveRecord::Base
  has_many :orders

  def as_json(options = {})
    super(options.merge(except: [:created_at, :updated_at],
                        methods: [:url]))
  end

  def my_method
    "user does whatever"
  end

  def url
    "pizza.com"
  end

  def rails_rules
    "lul"
  end
end


