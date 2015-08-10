module ApplicationHelper
  # cache_key_for(Item, "items-list")
  def cache_key_for(model_class, label = "")
    class_name = model_class.name
    count = model_class.count
    max_timestamp = model_class.maximum(:updated_at)
    [label, class_name, count, max_timestamp].join("-")
  end
end
