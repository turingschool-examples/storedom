require "test_helper"

class StoreTest < ActiveSupport::TestCase
  def store
    @store ||= Store.new
  end

  def test_valid
    assert store.valid?
  end
end
