class Api::V1::ItemsController < Api::V1::BaseController
  before_filter :example_filter
  respond_to :json

  def index
    ###### Manual JSON caching
    #Uses Dalli / Memcached (or other configurable cache store)
    #expires_in is seconds
    json = cache("v1/items/index", expires_in: 5) do
      Item.all.to_json
    end
    respond_with json
  end

  caches_page :show
  def show
    ### Statically cache all the output from this action using
    # ActionPack Page Caching; by default this stores content in static
    # file on filesystem
    # Notice that neither the action nor the controller's filters
    # are hit using this method
    # Note that specifying a request format is needed for a cache hit
    # since otherwise Rails needs to go through content negotiation to
    # decide which format to render
    # (i.e. items/1.json will be cached but items/1 will not)
    Rails.logger.info("Processing Action Show...")
    respond_with Item.find(params[:id])
  end

  caches_action :fancy
  def fancy
    ### Statically cache output from this action at the Controller level
    # using ActionPack Action Caching
    # WILL run before filters; useful if you need to auth
    # This method will use Rails' configured cache (Memcached for this app)
    Rails.logger.info("Processing Action Fancy...")
    respond_with({woo: "action caching", item: Item.find(params[:id])})
  end

  def example_filter
    # Watch for this log statement to see if your caching method is processing
    # before filters or not
    Rails.logger.info("Processing Example Filter")
  end
end
