class Stores::StoresController < ApplicationController

  before_action :store_not_found

  def store_not_found
    redirect_to root_path unless current_store
  end
end
