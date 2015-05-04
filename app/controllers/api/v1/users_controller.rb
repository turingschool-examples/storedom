class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json
  def show
    respond_with User.find(params[:id])
  end
end
